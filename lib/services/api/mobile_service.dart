import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_app/data/local_storage/shared_preferences.dart';
import 'package:notes_app/resource/strings_manager.dart';
import 'package:notes_app/services/api/end_points.dart';

class NetworkService {
  static final NetworkService _singleton = NetworkService._internal();

  factory NetworkService() {
    return _singleton;
  }

  Dio get dio {
    Dio dio = Dio();
    dio.options.baseUrl = EndPoints.baseUrl;
    //dio.options.connectTimeout = const Duration(seconds: 7); //5s
    //dio.options.receiveTimeout = const Duration(seconds: 7);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          String? token = Preference.getString(PrefKeys.apiTokenKey);
          String? lang = Preference.getString(PrefKeys.languageCode);
          debugPrint("User token : ****   $token");
          Map<String, String>? headers;

          headers = {
            'Content-Type': 'application/json',
            "accept": "application/json",
            "x-lang": lang ?? 'en',
            if (token != '')
              AppStrings.authorizationKey: '${AppStrings.bearerKey} $token',
          };

          options.headers = headers;

          if (kDebugMode) {
            debugPrint("baseUrl From**********: ${options.baseUrl}");
            debugPrint("endPoint**********: ${options.path},");
            debugPrint("Headers**********: ${options.headers},");
            debugPrint("data**********: ${options.data.toString()}");
          }

          return handler.next(options); //continue
        },
        onResponse: (Response response, handler) async {
          if (kDebugMode) {
            debugPrint("Response From:${response.data},");
          }
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) async {
          if (kDebugMode) {
            debugPrint("dio error response ---------${e.response}");
            debugPrint("dio error ---------${e.error}");
            debugPrint("dio error ---------${e.type}");
            debugPrint("dio error ---------${e.requestOptions.path}");
          }

          return handler.next(e);
        },
      ),
    );
    return dio;
  }

  NetworkService._internal();
}
