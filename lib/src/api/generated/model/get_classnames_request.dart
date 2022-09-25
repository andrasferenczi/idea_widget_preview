//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetClassnamesRequest {
  /// Returns a new [GetClassnamesRequest] instance.
  GetClassnamesRequest({
    required this.previewedFilePath,
    this.transformFilePath,
  });

  /// The file whose preview we would like to see.
  String previewedFilePath;

  /// The location where the transformers are. (The classes that create a PreviewPage from custom type.) 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transformFilePath;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetClassnamesRequest &&
     other.previewedFilePath == previewedFilePath &&
     other.transformFilePath == transformFilePath;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (previewedFilePath.hashCode) +
    (transformFilePath == null ? 0 : transformFilePath!.hashCode);

  @override
  String toString() => 'GetClassnamesRequest[previewedFilePath=$previewedFilePath, transformFilePath=$transformFilePath]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'previewed_file_path'] = previewedFilePath;
    if (transformFilePath != null) {
      _json[r'transform_file_path'] = transformFilePath;
    } else {
      _json[r'transform_file_path'] = null;
    }
    return _json;
  }

  /// Returns a new [GetClassnamesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetClassnamesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetClassnamesRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetClassnamesRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetClassnamesRequest(
        previewedFilePath: mapValueOfType<String>(json, r'previewed_file_path')!,
        transformFilePath: mapValueOfType<String>(json, r'transform_file_path'),
      );
    }
    return null;
  }

  static List<GetClassnamesRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetClassnamesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetClassnamesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetClassnamesRequest> mapFromJson(dynamic json) {
    final map = <String, GetClassnamesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetClassnamesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetClassnamesRequest-objects as value to a dart map
  static Map<String, List<GetClassnamesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetClassnamesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetClassnamesRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'previewed_file_path',
  };
}

