//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DartApi {
  DartApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get the classnames needed to generate the preview file
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [GetClassnamesRequest] getClassnamesRequest (required):
  Future<Response> dartGetClassnamesPostWithHttpInfo(GetClassnamesRequest getClassnamesRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/dart/get-classnames';

    // ignore: prefer_final_locals
    Object? postBody = getClassnamesRequest;

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

  /// Get the classnames needed to generate the preview file
  ///
  /// Parameters:
  ///
  /// * [GetClassnamesRequest] getClassnamesRequest (required):
  Future<GetClassnamesResponse?> dartGetClassnamesPost(GetClassnamesRequest getClassnamesRequest,) async {
    final response = await dartGetClassnamesPostWithHttpInfo(getClassnamesRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetClassnamesResponse',) as GetClassnamesResponse;
    
    }
    return null;
  }

  /// Stop the dart server and shuts down the process.  The only 'reliable' way to close the server is by sending an API request. (This only works of course, if some other process keeps track of the URL where the server was opened.)  Because dart starts a process whose parent is launchd (on Mac), so child process is not killed when killing this process.  Subscribing to SIG_... is useless: SIGINT:    - only upside is that CTRL+C will work when started from terminal    - the Java Process.destroy() sends SIGTERM on Linux and SIGKILL on Windows       https://stackoverflow.com/a/7835545       https://mail.openjdk.org/pipermail/core-libs-dev/2010-November/005159.html    - not available on Windows       https://api.dart.dev/stable/2.18.6/dart-io/ProcessSignal/watch.html SIGTERM:    - even if listening to this, it will not invoke the subscribed function SIGKILL:    - not possible to listen to this signal 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Empty] empty (required):
  Future<Response> dartShutdownPostWithHttpInfo(Empty empty,) async {
    // ignore: prefer_const_declarations
    final path = r'/dart/shutdown';

    // ignore: prefer_final_locals
    Object? postBody = empty;

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

  /// Stop the dart server and shuts down the process.  The only 'reliable' way to close the server is by sending an API request. (This only works of course, if some other process keeps track of the URL where the server was opened.)  Because dart starts a process whose parent is launchd (on Mac), so child process is not killed when killing this process.  Subscribing to SIG_... is useless: SIGINT:    - only upside is that CTRL+C will work when started from terminal    - the Java Process.destroy() sends SIGTERM on Linux and SIGKILL on Windows       https://stackoverflow.com/a/7835545       https://mail.openjdk.org/pipermail/core-libs-dev/2010-November/005159.html    - not available on Windows       https://api.dart.dev/stable/2.18.6/dart-io/ProcessSignal/watch.html SIGTERM:    - even if listening to this, it will not invoke the subscribed function SIGKILL:    - not possible to listen to this signal 
  ///
  /// Parameters:
  ///
  /// * [Empty] empty (required):
  Future<Empty?> dartShutdownPost(Empty empty,) async {
    final response = await dartShutdownPostWithHttpInfo(empty,);
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
