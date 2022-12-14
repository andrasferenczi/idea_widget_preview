//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewTheme {
  /// Returns a new [PreviewTheme] instance.
  PreviewTheme({
    required this.background,
    required this.text,
  });

  /// Hexadecimal representation of the color
  String background;

  /// Hexadecimal representation of the color
  String text;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewTheme &&
     other.background == background &&
     other.text == text;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (background.hashCode) +
    (text.hashCode);

  @override
  String toString() => 'PreviewTheme[background=$background, text=$text]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'background'] = background;
      _json[r'text'] = text;
    return _json;
  }

  /// Returns a new [PreviewTheme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewTheme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PreviewTheme[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PreviewTheme[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PreviewTheme(
        background: mapValueOfType<String>(json, r'background')!,
        text: mapValueOfType<String>(json, r'text')!,
      );
    }
    return null;
  }

  static List<PreviewTheme>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewTheme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewTheme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewTheme> mapFromJson(dynamic json) {
    final map = <String, PreviewTheme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewTheme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewTheme-objects as value to a dart map
  static Map<String, List<PreviewTheme>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PreviewTheme>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewTheme.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'background',
    'text',
  };
}

