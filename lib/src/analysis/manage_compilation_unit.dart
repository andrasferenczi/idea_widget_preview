import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';

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
    print("Errors occurred:\n");
    for (final error in errors) {
      print("${error.message}\n");
    }
  }

  final unit = parseResult.unit;
  return visit(unit);
}
