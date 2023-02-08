// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owwn_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _OWWNClient implements OWWNClient {
  _OWWNClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://ccoding.owwn.com/hermes';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse> getUsers(
    int limit,
    int page,
    String apiToken,
    String apiKey,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'limit': limit,
      'page': page,
    };
    final _headers = <String, dynamic>{
      'Authorization': apiToken,
      'X-API-KEY': apiKey,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),),);
    final value = ApiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Map<String, String>> authenticate(
    String apiKey,
    Map<String, dynamic> emailMap,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{'X-API-KEY': apiKey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(emailMap);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),),);
    final value = _result.data!.cast<String, String>();
    return value;
  }

  @override
  Future<Map<String, String>> refreshToken(
    String apiKey,
    Map<String, dynamic> refreshMap,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{'X-API-KEY': apiKey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(refreshMap);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/refresh',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),),);
    final value = _result.data!.cast<String, String>();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
