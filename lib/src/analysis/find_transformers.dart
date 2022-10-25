import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class TransformerEntry {
  /// The name of the class that converts the given class to PreviewPage
  /// This class is located in the transformers .dart path.
  final String classnameOfTransformer;

  /// The type that can be transformed using the class above
  final String classnameOfTransformedType;

  const TransformerEntry({
    required this.classnameOfTransformer,
    required this.classnameOfTransformedType,
  });
}

class FindTransformersResult {
  /// type (key) to implementation classname
  /// ... we do not know if that type is interface or class
  final List<TransformerEntry> entries = [];

  FindTransformersResult.empty();
}

Future<FindTransformersResult> findTransformerResult({
  required CompilationUnit unit,
}) async {
  final collector = FindTransformersResult.empty();

  unit.visitChildren(
    _GenericExtractVisitor(
      collector: collector,
    ),
  );

  return collector;
}

class _GenericExtractVisitor extends RecursiveAstVisitor<dynamic> {
  final FindTransformersResult collector;

  _GenericExtractVisitor({
    required this.collector,
  });

  String? _getGenericMappedPreviewType(NamedType namedType) {
    if (namedType.name.toString() != 'ToPreviewProvider') {
      return null;
    }

    return namedType.typeArguments?.arguments.first.toString();
  }

  String? _getGenericMapperType(List<NamedType> namedTypes) {
    return namedTypes.map((type) => _getGenericMappedPreviewType(type)).first;
  }

  List<NamedType> getSuperTypes(ClassDeclaration node) {
    final namedTypes = <NamedType>[];

    final extendsNamedType = node.extendsClause?.superclass;
    if (extendsNamedType != null) {
      namedTypes.add(extendsNamedType);
    }

    namedTypes.addAll(node.implementsClause?.interfaces ?? []);

    return namedTypes;
  }

  @override
  dynamic visitClassDeclaration(ClassDeclaration node) {
    final classname = node.name2.toString();

    // both implements and extends are technically correct,
    // because this is an abstract class

    final namedTypes = getSuperTypes(node);

    final genericType = _getGenericMapperType(namedTypes);
    if (genericType != null) {
      collector.entries.add(TransformerEntry(
        classnameOfTransformer: classname,
        classnameOfTransformedType: genericType,
      ));
    }

    return super.visitClassDeclaration(node);
  }
}
