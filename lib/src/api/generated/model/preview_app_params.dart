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
    required this.clientId,
    required this.initialViewState,
    this.kotlinServerPort,
    required this.previewId,
    required this.previewedFilePath,
    required this.theme,
  });

  /// The id used to identify the process (among modules).  Technically, preview_id identifies it, but it is more consistent to name it. 
  String clientId;

  PreviewViewState initialViewState;

  /// The port number where the Kotlin server is reachable. This is where the Flutter process needs to send a request to, once it is rendering.  Platform._environment is not available in Flutter, that is why this one needs to be passed down explicitly. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? kotlinServerPort;

  PreviewId previewId;

  /// The file that is currently previewed
  String previewedFilePath;

  PreviewTheme theme;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewAppParams &&
     other.clientId == clientId &&
     other.initialViewState == initialViewState &&
     other.kotlinServerPort == kotlinServerPort &&
     other.previewId == previewId &&
     other.previewedFilePath == previewedFilePath &&
     other.theme == theme;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clientId.hashCode) +
    (initialViewState.hashCode) +
    (kotlinServerPort == null ? 0 : kotlinServerPort!.hashCode) +
    (previewId.hashCode) +
    (previewedFilePath.hashCode) +
    (theme.hashCode);

  @override
  String toString() => 'PreviewAppParams[clientId=$clientId, initialViewState=$initialViewState, kotlinServerPort=$kotlinServerPort, previewId=$previewId, previewedFilePath=$previewedFilePath, theme=$theme]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'client_id'] = clientId;
      _json[r'initial_view_state'] = initialViewState;
    if (kotlinServerPort != null) {
      _json[r'kotlin_server_port'] = kotlinServerPort;
    } else {
      _json[r'kotlin_server_port'] = null;
    }
      _json[r'preview_id'] = previewId;
      _json[r'previewed_file_path'] = previewedFilePath;
      _json[r'theme'] = theme;
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
        clientId: mapValueOfType<String>(json, r'client_id')!,
        initialViewState: PreviewViewState.fromJson(json[r'initial_view_state'])!,
        kotlinServerPort: mapValueOfType<int>(json, r'kotlin_server_port'),
        previewId: PreviewId.fromJson(json[r'preview_id'])!,
        previewedFilePath: mapValueOfType<String>(json, r'previewed_file_path')!,
        theme: PreviewTheme.fromJson(json[r'theme'])!,
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
    'client_id',
    'initial_view_state',
    'preview_id',
    'previewed_file_path',
    'theme',
  };
}

