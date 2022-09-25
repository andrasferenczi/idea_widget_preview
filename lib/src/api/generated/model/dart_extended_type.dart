//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DartExtendedType {
  /// Instantiate a new enum with the provided [value].
  const DartExtendedType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const mixinType = DartExtendedType._(r'mixin_type');
  static const classType = DartExtendedType._(r'class_type');
  static const interfaceType = DartExtendedType._(r'interface_type');

  /// List of all possible values in this [enum][DartExtendedType].
  static const values = <DartExtendedType>[
    mixinType,
    classType,
    interfaceType,
  ];

  static DartExtendedType? fromJson(dynamic value) => DartExtendedTypeTypeTransformer().decode(value);

  static List<DartExtendedType>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DartExtendedType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DartExtendedType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DartExtendedType] to String,
/// and [decode] dynamic data back to [DartExtendedType].
class DartExtendedTypeTypeTransformer {
  factory DartExtendedTypeTypeTransformer() => _instance ??= const DartExtendedTypeTypeTransformer._();

  const DartExtendedTypeTypeTransformer._();

  String encode(DartExtendedType data) => data.value;

  /// Decodes a [dynamic value][data] to a DartExtendedType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DartExtendedType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'mixin_type': return DartExtendedType.mixinType;
        case r'class_type': return DartExtendedType.classType;
        case r'interface_type': return DartExtendedType.interfaceType;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DartExtendedTypeTypeTransformer] instance.
  static DartExtendedTypeTypeTransformer? _instance;
}

