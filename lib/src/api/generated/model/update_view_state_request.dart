//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateViewStateRequest {
  /// Returns a new [UpdateViewStateRequest] instance.
  UpdateViewStateRequest({
    required this.clientInfo,
    required this.previewId,
    required this.previewViewState,
  });

  ClientInfo clientInfo;

  PreviewId previewId;

  PreviewViewState previewViewState;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateViewStateRequest &&
     other.clientInfo == clientInfo &&
     other.previewId == previewId &&
     other.previewViewState == previewViewState;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clientInfo.hashCode) +
    (previewId.hashCode) +
    (previewViewState.hashCode);

  @override
  String toString() => 'UpdateViewStateRequest[clientInfo=$clientInfo, previewId=$previewId, previewViewState=$previewViewState]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'client_info'] = clientInfo;
      _json[r'preview_id'] = previewId;
      _json[r'preview_view_state'] = previewViewState;
    return _json;
  }

  /// Returns a new [UpdateViewStateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateViewStateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateViewStateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateViewStateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateViewStateRequest(
        clientInfo: ClientInfo.fromJson(json[r'client_info'])!,
        previewId: PreviewId.fromJson(json[r'preview_id'])!,
        previewViewState: PreviewViewState.fromJson(json[r'preview_view_state'])!,
      );
    }
    return null;
  }

  static List<UpdateViewStateRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateViewStateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateViewStateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateViewStateRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateViewStateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateViewStateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateViewStateRequest-objects as value to a dart map
  static Map<String, List<UpdateViewStateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateViewStateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateViewStateRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'client_info',
    'preview_id',
    'preview_view_state',
  };
}

