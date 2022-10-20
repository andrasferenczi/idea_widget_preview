//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FlutterPreviewReadyRequest {
  /// Returns a new [FlutterPreviewReadyRequest] instance.
  FlutterPreviewReadyRequest({
    required this.previewId,
  });

  /// The same id that was passed down to the app.
  int previewId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FlutterPreviewReadyRequest &&
     other.previewId == previewId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (previewId.hashCode);

  @override
  String toString() => 'FlutterPreviewReadyRequest[previewId=$previewId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'preview_id'] = previewId;
    return _json;
  }

  /// Returns a new [FlutterPreviewReadyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FlutterPreviewReadyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FlutterPreviewReadyRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FlutterPreviewReadyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FlutterPreviewReadyRequest(
        previewId: mapValueOfType<int>(json, r'preview_id')!,
      );
    }
    return null;
  }

  static List<FlutterPreviewReadyRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FlutterPreviewReadyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FlutterPreviewReadyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FlutterPreviewReadyRequest> mapFromJson(dynamic json) {
    final map = <String, FlutterPreviewReadyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FlutterPreviewReadyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FlutterPreviewReadyRequest-objects as value to a dart map
  static Map<String, List<FlutterPreviewReadyRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FlutterPreviewReadyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FlutterPreviewReadyRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'preview_id',
  };
}

