//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RegisterClientRequest {
  /// Returns a new [RegisterClientRequest] instance.
  RegisterClientRequest({
    required this.clientInfo,
    required this.port,
  });

  ClientInfo clientInfo;

  /// The port of the server the client is listening on
  int port;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterClientRequest &&
     other.clientInfo == clientInfo &&
     other.port == port;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clientInfo.hashCode) +
    (port.hashCode);

  @override
  String toString() => 'RegisterClientRequest[clientInfo=$clientInfo, port=$port]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'client_info'] = clientInfo;
      _json[r'port'] = port;
    return _json;
  }

  /// Returns a new [RegisterClientRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RegisterClientRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RegisterClientRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RegisterClientRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RegisterClientRequest(
        clientInfo: ClientInfo.fromJson(json[r'client_info'])!,
        port: mapValueOfType<int>(json, r'port')!,
      );
    }
    return null;
  }

  static List<RegisterClientRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RegisterClientRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RegisterClientRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RegisterClientRequest> mapFromJson(dynamic json) {
    final map = <String, RegisterClientRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegisterClientRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RegisterClientRequest-objects as value to a dart map
  static Map<String, List<RegisterClientRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RegisterClientRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegisterClientRequest.listFromJson(entry.value, growable: growable,);
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
    'port',
  };
}

