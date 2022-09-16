import 'dart:io';

import 'package:dio/dio.dart';

import '../i_remote_client.dart';

// TODO refactor
class DioClient implements IRemoteClient {
  final Dio dio;
  const DioClient(this.dio);

  @override
  Future get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      final msg = "$endpoint-${response.statusCode}-${response.statusMessage}";
      throw HttpException(msg);
    }

    return response.data;
  }

  @override
  Future post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.post(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      final msg = "$endpoint-${response.statusCode}-${response.statusMessage}";
      throw HttpException(msg);
    }

    return response.data;
  }

  @override
  Future delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
