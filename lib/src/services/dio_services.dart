// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/data/remote/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//Singleton class
class DioClientService {
  static final DioClientService _dioClientService = DioClientService._();
  Dio? _client;

  DioClientService._();

  factory DioClientService() {
    return _dioClientService;
  }

  Dio getClient() {
    if (_client == null) {
      _initializeDio();
    }
    return _client!;
  }

  _initializeDio() {
    _client = Dio()
      ..options = BaseOptions(
          baseUrl: EndPoints.BASE_URL,
          contentType: "application/json",
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30))
      ..interceptors.add(InterceptorsWrapper(onError: _onError));

    if (kDebugMode) {
      _client?.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    }
  }

  disposeClient() {
    _client?.close(force: true);
    _client = null;
  }

  void _onError(DioException e, ErrorInterceptorHandler handler) async {
    try {
      handler.next(e);
    } on DioException catch (ex) {
      handler.next(ex);
    } on Exception catch (_) {
      handler.next(e);
    }
  }
}
