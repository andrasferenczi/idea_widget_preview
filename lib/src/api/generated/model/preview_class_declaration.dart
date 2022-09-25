//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewClassDeclaration {
  /// Returns a new [PreviewClassDeclaration] instance.
  PreviewClassDeclaration({
    required this.classname,
    required this.extendedType,
    required this.superName,
    this.transformerName,
  });

  /// The name of the class in the file that renders the preview.
  String classname;

  DartExtendedType extendedType;

  /// The name of the mixin / class / interface this implements. That type is the reason this class should be rendered. 
  String superName;

  /// The classname of the transformer, that is able to convert this class to PreviewPage.  Value is null, if no transformer is needed and the widget is a library type. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transformerName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewClassDeclaration &&
     other.classname == classname &&
     other.extendedType == extendedType &&
     other.superName == superName &&
     other.transformerName == transformerName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (classname.hashCode) +
    (extendedType.hashCode) +
    (superName.hashCode) +
    (transformerName == null ? 0 : transformerName!.hashCode);

  @override
  String toString() => 'PreviewClassDeclaration[classname=$classname, extendedType=$extendedType, superName=$superName, transformerName=$transformerName]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'classname'] = classname;
      _json[r'extended_type'] = extendedType;
      _json[r'super_name'] = superName;
    if (transformerName != null) {
      _json[r'transformer_name'] = transformerName;
    } else {
      _json[r'transformer_name'] = null;
    }
    return _json;
  }

  /// Returns a new [PreviewClassDeclaration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewClassDeclaration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PreviewClassDeclaration[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PreviewClassDeclaration[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PreviewClassDeclaration(
        classname: mapValueOfType<String>(json, r'classname')!,
        extendedType: DartExtendedType.fromJson(json[r'extended_type'])!,
        superName: mapValueOfType<String>(json, r'super_name')!,
        transformerName: mapValueOfType<String>(json, r'transformer_name'),
      );
    }
    return null;
  }

  static List<PreviewClassDeclaration>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewClassDeclaration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewClassDeclaration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewClassDeclaration> mapFromJson(dynamic json) {
    final map = <String, PreviewClassDeclaration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewClassDeclaration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewClassDeclaration-objects as value to a dart map
  static Map<String, List<PreviewClassDeclaration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PreviewClassDeclaration>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewClassDeclaration.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'classname',
    'extended_type',
    'super_name',
  };
}

