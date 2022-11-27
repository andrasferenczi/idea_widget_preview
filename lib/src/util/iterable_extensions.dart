import 'package:collection/collection.dart';

/// Named differently from the iterable_extensions.dart in the collection package
extension IterableDoubleExtensions on Iterable<double> {
  int? indexOfMinByOrNull(double Function(double value) by) {
    int? minIndex;
    var minCompared = 0.0;

    forEachIndexed((index, value) {
      final compared = by(value);

      final isNewValue = minIndex == null || compared < minCompared;

      if (isNewValue) {
        minIndex = index;
        minCompared = compared;
      }
    });

    return minIndex;
  }
}
