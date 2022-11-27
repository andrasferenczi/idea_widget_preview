//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OnFlutterErrorRequest {
  /// Returns a new [OnFlutterErrorRequest] instance.
  OnFlutterErrorRequest({
    this.message,
    required this.previewId,
    this.stacktrace,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  PreviewId previewId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stacktrace;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OnFlutterErrorRequest &&
     other.message == message &&
     other.previewId == previewId &&
     other.stacktrace == stacktrace &&
     other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message == null ? 0 : message!.hashCode) +
    (previewId.hashCode) +
    (stacktrace == null ? 0 : stacktrace!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'OnFlutterErrorRequest[message=$message, previewId=$previewId, stacktrace=$stacktrace, type=$type]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (message != null) {
      _json[r'message'] = message;
    } else {
      _json[r'message'] = null;
    }
      _json[r'preview_id'] = previewId;
    if (stacktrace != null) {
      _json[r'stacktrace'] = stacktrace;
    } else {
      _json[r'stacktrace'] = null;
    }
    if (type != null) {
      _json[r'type'] = type;
    } else {
      _json[r'type'] = null;
    }
    return _json;
  }

  /// Returns a new [OnFlutterErrorRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OnFlutterErrorRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OnFlutterErrorRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OnFlutterErrorRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OnFlutterErrorRequest(
        message: mapValueOfType<String>(json, r'message'),
        previewId: PreviewId.fromJson(json[r'preview_id'])!,
        stacktrace: mapValueOfType<String>(json, r'stacktrace'),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<OnFlutterErrorRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OnFlutterErrorRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OnFlutterErrorRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OnFlutterErrorRequest> mapFromJson(dynamic json) {
    final map = <String, OnFlutterErrorRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OnFlutterErrorRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OnFlutterErrorRequest-objects as value to a dart map
  static Map<String, List<OnFlutterErrorRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OnFlutterErrorRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OnFlutterErrorRequest.listFromJson(entry.value, growable: growable,);
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

