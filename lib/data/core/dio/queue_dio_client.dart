import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';

import '../i_remote_client.dart';

class DioQueueClient implements IRemoteClient {
  final Dio dio;

  DioQueueClient(this.dio) {
    _requestQueue = Queue();
    _isGettingAuth = false;
  }

  late Queue<RequestCompleter> _requestQueue;
  late bool _isGettingAuth;

  @override
  Future delete(String endpoint, {Map<String, dynamic>? queryParameters}) {
    // TODO setup request
    final request = Request("DELETE", Uri());
    return _request(request);
  }

  @override
  Future get(String endpoint, {Map<String, dynamic>? queryParameters}) {
    // TODO setup request
    final request = Request("GET", Uri());
    return _request(request);
  }

  @override
  Future post(String endpoint, {Map<String, dynamic>? queryParameters}) {
    // TODO setup request
    final request = Request("POST", Uri());
    return _request(request);
  }

  @override
  Future put(String endpoint, {Map<String, dynamic>? queryParameters}) {
    // TODO setup request
    final request = Request("PUT", Uri());
    return _request(request);
  }

  Future _request(Request request) async {
    if (_isGettingAuth) {
      final completer = Completer();
      final reqCompleter = RequestCompleter(completer, request);
      _requestQueue.add(reqCompleter);
      return reqCompleter.completer.future;
    }

    final response = await dio.request(
      request.url.path,
      queryParameters: request.url.queryParameters,
    );
    return responseHandler(response);
  }

  responseHandler(Response<dynamic> response) {
    if (response.statusCode == 200) {
      // success
      return response.data;
    } else if (response.statusCode == 401) {
      // is refresh token error
      _isGettingAuth = true;
      final completer = Completer();
      final request = Request("method", response.realUri);
      final reqCompleter = RequestCompleter(completer, request);
      _requestQueue.add(reqCompleter);
      // TODO make ARQ
      dio.request("ARQ").then((value) {
        // TODO update token
        dio.options.headers["Authorization"] = value.data;
        _isGettingAuth = false;
        _cleanQueue();
      });
    }
  }

  void _cleanQueue() async {
    while (_requestQueue.isNotEmpty) {
      final RequestCompleter requestCompleter = _requestQueue.removeFirst();
      final response = await _request(requestCompleter.request);
      final result = responseHandler(response);
      requestCompleter.completer.complete(result);
    }
  }
}

class RequestCompleter {
  final Completer completer;
  final Request request;

  RequestCompleter(this.completer, this.request);
}

class Request {
  final String method;
  final Uri url;

  Request(this.method, this.url);
}
