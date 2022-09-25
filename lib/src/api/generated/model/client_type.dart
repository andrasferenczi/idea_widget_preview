//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ClientType {
  /// Instantiate a new enum with the provided [value].
  const ClientType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const flutterPreview = ClientType._(r'flutter_preview');
  static const analysisServer = ClientType._(r'analysis_server');

  /// List of all possible values in this [enum][ClientType].
  static const values = <ClientType>[
    flutterPreview,
    analysisServer,
  ];

  static ClientType? fromJson(dynamic value) => ClientTypeTypeTransformer().decode(value);

  static List<ClientType>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ClientType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClientType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ClientType] to String,
/// and [decode] dynamic data back to [ClientType].
class ClientTypeTypeTransformer {
  factory ClientTypeTypeTransformer() => _instance ??= const ClientTypeTypeTransformer._();

  const ClientTypeTypeTransformer._();

  String encode(ClientType data) => data.value;

  /// Decodes a [dynamic value][data] to a ClientType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ClientType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'flutter_preview': return ClientType.flutterPreview;
        case r'analysis_server': return ClientType.analysisServer;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ClientTypeTypeTransformer] instance.
  static ClientTypeTypeTransformer? _instance;
}

