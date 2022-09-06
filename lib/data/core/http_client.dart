import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'key.dart';

final currentsDioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
        baseUrl: CURRENTS_API_End_Point,
        headers: {"Authorization": CURRENTS_API_Key}),
  )..interceptors.add(
      LogInterceptor(
        requestHeader: true,
        responseHeader: true,
      ),
    );
});
