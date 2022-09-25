//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetClassnamesResponse {
  /// Returns a new [GetClassnamesResponse] instance.
  GetClassnamesResponse({
    this.declarations = const [],
  });

  List<PreviewClassDeclaration> declarations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetClassnamesResponse &&
     other.declarations == declarations;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (declarations.hashCode);

  @override
  String toString() => 'GetClassnamesResponse[declarations=$declarations]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'declarations'] = declarations;
    return _json;
  }

  /// Returns a new [GetClassnamesResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetClassnamesResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetClassnamesResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetClassnamesResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetClassnamesResponse(
        declarations: PreviewClassDeclaration.listFromJson(json[r'declarations'])!,
      );
    }
    return null;
  }

  static List<GetClassnamesResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetClassnamesResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetClassnamesResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetClassnamesResponse> mapFromJson(dynamic json) {
    final map = <String, GetClassnamesResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetClassnamesResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetClassnamesResponse-objects as value to a dart map
  static Map<String, List<GetClassnamesResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetClassnamesResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetClassnamesResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'declarations',
  };
}

