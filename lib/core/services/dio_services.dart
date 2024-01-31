import 'package:dio/dio.dart';
import '../constants/api_constance.dart';

class DioService {
  final Dio dio;

  DioService({
    required this.dio,
  }) {
    {
      dio
        ..options.baseUrl = ApiConstance.baseUrl
        ..options.connectTimeout = const Duration(minutes: 2)
        ..options.receiveTimeout = const Duration(minutes: 2)
        ..options.responseType = ResponseType.json
        ..options.headers = {
        'content-type': 'application/json'
    };
    }
  }

  Future get({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: {
        }),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    FormData? formData,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {

        }),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {

        }),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {

        }),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {

        }),
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
