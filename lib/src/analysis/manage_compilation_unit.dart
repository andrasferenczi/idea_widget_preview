import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';

Future<T> manageCompilationUnit<T>({
  required String filePath,
  required Future<T> Function(CompilationUnit unit) visit,
}) async {
  final file = File(filePath);
  final content = await file.readAsString();

  final parseResult = parseString(
    content: content,
    path: filePath,
    throwIfDiagnostics: false,
  );

  final errors = parseResult.errors;
  if (errors.isNotEmpty) {
    final severeErrors = errors
        .where((e) => e.severity == Severity.error)
        .toList(growable: false);

    print(
        "Severe errors occurred while compilation (${severeErrors.length} / ${errors.length})");
    for (final error in severeErrors) {
      print(error.message);
    }
  }

  final unit = parseResult.unit;
  return visit(unit);
}
