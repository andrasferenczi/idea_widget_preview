import 'package:collection/collection.dart';
import 'package:preview/src/analysis/find_classes.dart';
import 'package:preview/src/analysis/find_transformers.dart';
import 'package:preview/src/analysis/manage_compilation_unit.dart';

import '../api/generated/api.dart';

Future<GetClassnamesResponse> getClassnames(
  GetClassnamesRequest request,
) async {
  final transformers = await _findTransformers(path: request.transformFilePath);
  final transformableSuperName =
      transformers.entries.map((e) => e.classnameOfTransformedType);

  final builtInExtends = ['PreviewProvider'];
  final builtInMixins = ['PreviewPage'];

  final classes = await manageCompilationUnit(
    filePath: request.previewedFilePath,
    visit: (unit) async {
      return await findClasses(
        unit: unit,
        matchingExtends: [
          ...builtInExtends,
          ...transformableSuperName,
        ],
        matchingImplementations: [
          ...transformableSuperName,
        ],
        matchingMixins: builtInMixins,
      );
    },
  );

  final declarations = <PreviewClassDeclaration>[];

  declarations.addAll(_extractDeclarations(
    extendedType: DartExtendedType.mixinType,
    superToImpl: classes.foundMixins,
    transformers: transformers.entries,
  ));

  declarations.addAll(_extractDeclarations(
    extendedType: DartExtendedType.classType,
    superToImpl: classes.foundExtends,
    transformers: transformers.entries,
  ));

  declarations.addAll(_extractDeclarations(
    extendedType: DartExtendedType.interfaceType,
    superToImpl: classes.foundImplementations,
    transformers: transformers.entries,
  ));

  return GetClassnamesResponse(
    declarations: declarations,
  );
}

Future<FindTransformersResult> _findTransformers({
  required String? path,
}) async {
  if (path == null) {
    return FindTransformersResult.empty();
  }

  return manageCompilationUnit(
    filePath: path,
    visit: (unit) {
      return findTransformerResult(unit: unit);
    },
  );
}

List<PreviewClassDeclaration> _extractDeclarations({
  required DartExtendedType extendedType,
  required Map<String, List<String>> superToImpl,
  required List<TransformerEntry> transformers,
}) {
  return superToImpl.entries.expand(
    (entry) {
      return entry.value.map((String impl) {
        final superName = entry.key;

        return PreviewClassDeclaration(
          classname: impl,
          extendedType: extendedType,
          superName: superName,
          transformerName: transformers.firstWhereOrNull(
            (TransformerEntry transformer) {
              return transformer.classnameOfTransformedType == superName;
            },
          )?.classnameOfTransformer,
        );
      });
    },
  ).toList();
}
