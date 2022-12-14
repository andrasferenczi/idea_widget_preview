//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/dart_api.dart';
part 'api/kotlin_api.dart';

part 'model/client_info.dart';
part 'model/client_type.dart';
part 'model/dart_extended_type.dart';
part 'model/empty.dart';
part 'model/flutter_preview_ready_request.dart';
part 'model/get_classnames_request.dart';
part 'model/get_classnames_response.dart';
part 'model/on_flutter_error_request.dart';
part 'model/preview_app_params.dart';
part 'model/preview_class_declaration.dart';
part 'model/preview_id.dart';
part 'model/preview_theme.dart';
part 'model/preview_view_state.dart';
part 'model/register_client_request.dart';
part 'model/update_view_state_request.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
