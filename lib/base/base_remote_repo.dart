import 'dart:async';

import 'package:dio/dio.dart';
import 'package:grocery_app/main.dart';
import 'package:grocery_app/src/services/dio_services.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../models/response/base_response.dart';

class BaseRemoteRepo {
  final _api = DioClientService().getClient();

  Future<BaseResponse> get(
    String endPoint, {
    Map<String, String?>? query,
    Map<String, String>? headers,
    bool? addToken = true,
  }) async {
    try {
      headers ??= {};
      var response = await _api.request(
        endPoint,
        queryParameters: query,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      var res = BaseResponse.fromJson(response.data);

      return res;
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.unknown ||
          ex.type == DioExceptionType.connectionTimeout ||
          ex.type == DioExceptionType.connectionError ||
          ex.type == DioExceptionType.receiveTimeout) {
        return getErrorResponse(message: Constants.INTERNET_ERROR);
      }

      if (ex.response?.statusCode == 302 || ex.response?.statusCode == 401) {
        return getErrorResponse(
            message: Constants.API_SESSION_EXPIRE,
            error: Constants.API_SESSION_EXPIRE);
      }

      var message = 'error in api: $endPoint\n'
          'query parameters: $query\n'
          'status message: "${ex.response?.statusMessage}" and status code: "${ex.response?.statusCode}"\n'
          'response stacktrace: ${ex.response?.data}';

      await Sentry.captureException(Exception(message));
      return getErrorResponse(message: ex.message.toString());
    } on Exception catch (ex) {
      var message = 'error in api: $endPoint\n'
          'query parameters: $query\n'
          'exception: ${ex.toString()}';

      await Sentry.captureException(Exception(message));
      return getErrorResponse(message: ex.toString());
    }
  }

  Future<BaseResponse> post(
    String endPoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Object? formData,
    bool? addToken = true,
  }) async {
    try {
      headers ??= {};
      var response = await _api.request(
        endPoint,
        data: body ?? formData,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      var res = BaseResponse.fromJson(response.data);

      return res;
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.unknown ||
          ex.type == DioExceptionType.connectionTimeout ||
          ex.type == DioExceptionType.connectionError ||
          ex.type == DioExceptionType.receiveTimeout) {
        return getErrorResponse(message: Constants.INTERNET_ERROR);
      }

      if (ex.response?.statusCode == 302 || ex.response?.statusCode == 401) {
        return getErrorResponse(
            message: Constants.API_SESSION_EXPIRE,
            error: Constants.API_SESSION_EXPIRE);
      }

      var message = 'error in api: $endPoint\n'
          'request parameters: ${body ?? formData}\n'
          'status message: "${ex.response?.statusMessage}" and status code: "${ex.response?.statusCode}"\n'
          'response stacktrace: ${ex.response?.data}';

      await Sentry.captureException(Exception(message));
      return getErrorResponse(message: ex.message.toString());
    } on Exception catch (ex) {
      var message = 'error in api: $endPoint\n'
          'request parameters: ${body ?? formData}\n'
          'exception: ${ex.toString()}';

      await Sentry.captureException(Exception(message));
      return getErrorResponse(message: ex.toString());
    }
  }

  Future<BaseResponse> getSupaData(String endPoint, String query,
      String filteredColumn, String orderedColumn, bool ascending) async {
    try {
      var response = query.isNotEmpty
          ? await supabase
              .from(endPoint)
              .select('*')
              .ilike(filteredColumn, '%$query%')
              .order(orderedColumn, ascending: ascending)
          : await supabase
              .from(endPoint)
              .select('*')
              .limit(30)
              .order(orderedColumn, ascending: ascending);
      var baseResponse = BaseResponse(data: response, error: null, code: 200);
      return baseResponse;
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.unknown ||
          ex.type == DioExceptionType.connectionTimeout ||
          ex.type == DioExceptionType.connectionError ||
          ex.type == DioExceptionType.receiveTimeout) {
        return getErrorResponse(message: Constants.INTERNET_ERROR);
      }

      if (ex.response?.statusCode == 302 || ex.response?.statusCode == 401) {
        return getErrorResponse(
            message: Constants.API_SESSION_EXPIRE,
            error: Constants.API_SESSION_EXPIRE);
      }

      var message = ex.message;

      await Sentry.captureException(Exception(message));
      return getErrorResponse(message: ex.message.toString());
    } on Exception catch (ex) {
      await Sentry.captureException(Exception(ex));
      return getErrorResponse(message: ex.toString());
    }
  }

  BaseResponse getSuccessResponse(dynamic data) => BaseResponse(data: data);

  BaseResponse getErrorResponse({String? message, String? error}) =>
      BaseResponse(
          data: null, msg: message ?? Constants.API_FAILURE, error: error);
}
