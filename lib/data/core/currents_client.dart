import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio/dio_client.dart';
import 'i_remote_client.dart';
import 'key.dart';

final currentsClientProvider = Provider<IRemoteClient>((ref) {
  return DioClient(
    Dio(
      BaseOptions(
          baseUrl: currentsApiEndPoint,
          headers: {"Authorization": currentsApiKey}),
    )..interceptors.add(
        LogInterceptor(
          requestHeader: true,
          responseHeader: true,
        ),
      ),
  );
});
