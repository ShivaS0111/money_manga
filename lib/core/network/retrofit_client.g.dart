// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ProductListResponse> getOfflineProducts(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'data': data};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ProductListResponse>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options,
            'http://qc-cp-mgr-v2-api.ebutor.com/mobileapi/v2/getOfflineProducts',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GitSearchResponse> gitSearch(language) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'language': language};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GitSearchResponse>(Options(
                method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, 'https://api.github.com/legacy/repos/search/Go',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GitSearchResponse.fromJson(_result.data!);
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
