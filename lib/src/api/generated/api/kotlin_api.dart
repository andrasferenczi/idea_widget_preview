//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class KotlinApi {
  KotlinApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Flutter client calls back using the endpoint to notify when the widgets have been rendered.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [FlutterPreviewReadyRequest] flutterPreviewReadyRequest (required):
  Future<Response> kotlinFlutterPreviewReadyPostWithHttpInfo(FlutterPreviewReadyRequest flutterPreviewReadyRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/kotlin/flutter-preview-ready';

    // ignore: prefer_final_locals
    Object? postBody = flutterPreviewReadyRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Flutter client calls back using the endpoint to notify when the widgets have been rendered.
  ///
  /// Parameters:
  ///
  /// * [FlutterPreviewReadyRequest] flutterPreviewReadyRequest (required):
  Future<Empty?> kotlinFlutterPreviewReadyPost(FlutterPreviewReadyRequest flutterPreviewReadyRequest,) async {
    final response = await kotlinFlutterPreviewReadyPostWithHttpInfo(flutterPreviewReadyRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Empty',) as Empty;
    
    }
    return null;
  }

  /// Dart client can register through this endpoint if it listens on a specific port
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RegisterClientRequest] registerClientRequest (required):
  Future<Response> kotlinRegisterClientPostWithHttpInfo(RegisterClientRequest registerClientRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/kotlin/register-client';

    // ignore: prefer_final_locals
    Object? postBody = registerClientRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Dart client can register through this endpoint if it listens on a specific port
  ///
  /// Parameters:
  ///
  /// * [RegisterClientRequest] registerClientRequest (required):
  Future<Empty?> kotlinRegisterClientPost(RegisterClientRequest registerClientRequest,) async {
    final response = await kotlinRegisterClientPostWithHttpInfo(registerClientRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Empty',) as Empty;
    
    }
    return null;
  }

  /// Update the view state so the plugin knows about it and can restore it.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateViewStateRequest] updateViewStateRequest (required):
  Future<Response> kotlinUpdateViewStatePostWithHttpInfo(UpdateViewStateRequest updateViewStateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/kotlin/update-view-state';

    // ignore: prefer_final_locals
    Object? postBody = updateViewStateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update the view state so the plugin knows about it and can restore it.
  ///
  /// Parameters:
  ///
  /// * [UpdateViewStateRequest] updateViewStateRequest (required):
  Future<Empty?> kotlinUpdateViewStatePost(UpdateViewStateRequest updateViewStateRequest,) async {
    final response = await kotlinUpdateViewStatePostWithHttpInfo(updateViewStateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Empty',) as Empty;
    
    }
    return null;
  }
}
