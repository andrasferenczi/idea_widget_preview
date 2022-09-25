import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:collection/collection.dart';

class FindClassesResult {
  /// type (key) to list of implementation classes (values)
  final Map<String, List<String>> foundExtends = {};
  final Map<String, List<String>> foundImplementations = {};
  final Map<String, List<String>> foundMixins = {};

  FindClassesResult.empty();
}

Future<FindClassesResult> findClasses({
  required CompilationUnit unit,
  List<String> matchingExtends = const [],
  List<String> matchingImplementations = const [],
  List<String> matchingMixins = const [],
}) async {
  final collector = FindClassesResult.empty();

  unit.visitChildren(
    _ExtractorVisitor(
      result: collector,
      matchingExtends: matchingExtends,
      matchingImplementations: matchingImplementations,
      matchingMixins: matchingMixins,
    ),
  );

  return collector;
}

class _ExtractorVisitor extends RecursiveAstVisitor<dynamic> {
  final FindClassesResult result;

  final List<String> matchingExtends;
  final List<String> matchingImplementations;
  final List<String> matchingMixins;

  const _ExtractorVisitor({
    required this.result,
    required this.matchingExtends,
    required this.matchingImplementations,
    required this.matchingMixins,
  });

  String? _firstExtendsOrNull(ClassDeclaration node) {
    if (matchingExtends.isEmpty) {
      return null;
    }

    final superClass = node.extendsClause?.superclass.toString();
    if (superClass == null) {
      return null;
    }

    return matchingExtends.firstWhereOrNull((element) => element == superClass);
  }

  String? _firstImplementsOrNull(ClassDeclaration node) {
    if (matchingImplementations.isEmpty) {
      return null;
    }

    final superInterfaces = node.implementsClause?.interfaces
        .map((e) => e.toString())
        .toList(growable: false);
    if (superInterfaces == null) {
      return null;
    }

    return matchingImplementations
        .firstWhereOrNull((element) => superInterfaces.contains(element));
  }

  String? _firstMixinOrNull(ClassDeclaration node) {
    if (matchingMixins.isEmpty) {
      return null;
    }

    final mixins = node.withClause?.mixinTypes
        .map((e) => e.toString())
        .toList(growable: false);
    if (mixins == null) {
      return null;
    }

    return matchingMixins
        .firstWhereOrNull((element) => mixins.contains(element));
  }

  @override
  dynamic visitClassDeclaration(ClassDeclaration node) {
    final classname = node.name2.toString();

    final foundExtends = _firstExtendsOrNull(node);
    if (foundExtends != null) {
      _addToMap(result.foundExtends, key: foundExtends, value: classname);
      return super.visitClassDeclaration(node);
    }

    final foundImplements = _firstImplementsOrNull(node);
    if (foundImplements != null) {
      _addToMap(result.foundImplementations,
          key: foundImplements, value: classname);
      return super.visitClassDeclaration(node);
    }

    final foundMixins = _firstMixinOrNull(node);
    if (foundMixins != null) {
      _addToMap(result.foundMixins, key: foundMixins, value: classname);
      return super.visitClassDeclaration(node);
    }

    return super.visitClassDeclaration(node);
  }
}

void _addToMap(
  Map<String, List<String>> map, {
  required String key,
  required String value,
}) {
  final entry = map[key] ?? [];
  entry.add(value);
  map[key] = entry;
}
