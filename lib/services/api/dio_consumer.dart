import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/model/api_response.dart';
import 'package:notes_app/resource/enums_manager.dart';
import 'package:notes_app/services/api/mobile_service.dart';

class DioConsumer {
  Future<ApiResponseModel> request(String path, ApiMethodType? requestType,
      {Object? body, Map<String, dynamic>? queryParameters}) async {
    Response<dynamic>? response;
    ApiResponseModel? apiResponseModel =
        ApiResponseModel(status: ApiStatus.idel);

    try {
      switch (requestType) {
        case ApiMethodType.get:
          response = await NetworkService()
              .dio
              .get(path, queryParameters: queryParameters);
          break;
        case ApiMethodType.post:
          response = await NetworkService()
              .dio
              .post(path, queryParameters: queryParameters, data: body);
          break;
        case ApiMethodType.put:
          response = await NetworkService()
              .dio
              .put(path, queryParameters: queryParameters, data: body);
          break;
        case ApiMethodType.delete:
          response = await NetworkService()
              .dio
              .delete(path, queryParameters: queryParameters, data: body);
          break;
        default:
          break;
      }
      if (response != null) {
        final message = (response.data['message'] is List)
            ? response.data['message'].join(', ').toString()
            : response.data['message'];

        if (response.data['statusCode'].toString().startsWith('2')) {
          apiResponseModel = ApiResponseModel(
              status: ApiStatus.success,
              data: response.data,
              message: message,
              stateCode: response.data['statusCode']);
        } else {
          apiResponseModel = ApiResponseModel(
              status: ApiStatus.error,
              data: response.data,
              stateCode: response.data['statusCode'],
              message: message);
        }
      }
    } on DioException catch (error) {
      debugPrint('🌐🌐ERROR in http ****** ${error.type} 🌐🌐\n******$error');
      if (error.response != null) {
        final message = (error.response?.data['message'] is List)
            ? error.response?.data['message'].join(', ').toString()
            : error.response?.data['message'];

        apiResponseModel = ApiResponseModel(
            status: ApiStatus.error,
            data: error.response?.data,
            stateCode: error.response?.statusCode ?? 400,
            message: message);
      } else {
        throw error.toString().contains('SocketException')
            ? " No Internet Connection"
            : error.error ?? "Unkown Error";
      }
    }

    return apiResponseModel;
  }
}
