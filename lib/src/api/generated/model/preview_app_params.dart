//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewAppParams {
  /// Returns a new [PreviewAppParams] instance.
  PreviewAppParams({
    required this.initialViewState,
    required this.kotlinServerPort,
    required this.previewId,
    required this.previewedFilePath,
  });

  PreviewViewState initialViewState;

  /// The port number where the Kotlin server is reachable. This is where the Flutter process needs to send a request to, once it is rendering.  Platform._environment is not available in Flutter, that is why this one needs to be passed down explicitly. 
  int kotlinServerPort;

  /// An identifier for the current render.
  int previewId;

  /// The file that is currently previewed
  String previewedFilePath;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewAppParams &&
     other.initialViewState == initialViewState &&
     other.kotlinServerPort == kotlinServerPort &&
     other.previewId == previewId &&
     other.previewedFilePath == previewedFilePath;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (initialViewState.hashCode) +
    (kotlinServerPort.hashCode) +
    (previewId.hashCode) +
    (previewedFilePath.hashCode);

  @override
  String toString() => 'PreviewAppParams[initialViewState=$initialViewState, kotlinServerPort=$kotlinServerPort, previewId=$previewId, previewedFilePath=$previewedFilePath]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'initial_view_state'] = initialViewState;
      _json[r'kotlin_server_port'] = kotlinServerPort;
      _json[r'preview_id'] = previewId;
      _json[r'previewed_file_path'] = previewedFilePath;
    return _json;
  }

  /// Returns a new [PreviewAppParams] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewAppParams? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PreviewAppParams[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PreviewAppParams[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PreviewAppParams(
        initialViewState: PreviewViewState.fromJson(json[r'initial_view_state'])!,
        kotlinServerPort: mapValueOfType<int>(json, r'kotlin_server_port')!,
        previewId: mapValueOfType<int>(json, r'preview_id')!,
        previewedFilePath: mapValueOfType<String>(json, r'previewed_file_path')!,
      );
    }
    return null;
  }

  static List<PreviewAppParams>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewAppParams>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewAppParams.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewAppParams> mapFromJson(dynamic json) {
    final map = <String, PreviewAppParams>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewAppParams.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewAppParams-objects as value to a dart map
  static Map<String, List<PreviewAppParams>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PreviewAppParams>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewAppParams.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'initial_view_state',
    'kotlin_server_port',
    'preview_id',
    'previewed_file_path',
  };
}

