import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

class BaseRemoteServices {
  Dio dio = Dio();
  CancelToken cancelToken = CancelToken();

  BaseRemoteServices() {
    updateDioInterceptors();
  }

  // Future<String> getAccessKey() async {
  //   AppStorage storage = AppStorage();
  //   // print(await storage.readAccessKey());
  //   return "Bearer ${await storage.readAccessKey()}";
  // }

  // Future<String> getRefreshKey() async {
  //   AppStorage storage = AppStorage();
  //   return await storage.readRefreshKey();
  // }

  void updateAuthorization(String token) {
    dio.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk3Njk5NzExLCJpYXQiOjE2OTc1MjY5MTEsImp0aSI6Ijg4YzJiYzYyMzY2MTQwODA5MzBhZWVmY2IzNDUxMTljIiwidXNlcl9pZCI6Mzh9.fxuhapWFxRnD3Bymc8LZbcaZ0Q7qNf5S9zc5fKWYbG4";
  }

  void updateDioInterceptors() {
    //getting dio instance
    dio

      //adding base options
      ..options = BaseOptions(
        headers: {
          "Accept": '*/*',
        },
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      )

      // adding logger info
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )

      //adding interceptors
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            log("${options.method} Request for ${options.uri.toString()}");

            options.cancelToken = cancelToken;
            return handler.next(options);
          },
          onResponse: (e, handler) async {
            return handler.next(e);
          },
          onError: (e, handler) async {
            log("=======>>error due to message: ${e.message}");
            log("=======>>error due to path: ${e.requestOptions.path}");
            // log("=======>>> stack tace ${e.stackTrace}");

            return handler.next(e);
          },
        ),
      );
  }

  // refreshToken(RequestOptions req) async {
  //   FormData data = FormData.fromMap({
  //     "refresh": await getRefreshKey(),
  //   });
  //   try {
  //     var response = await Dio().post(
  //       EndPoints.refreshToken,
  //       data: data,
  //       options: Options(
  //         validateStatus: (status) => true,
  //         receiveDataWhenStatusError: true,
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       String access = await response.data['access'];
  //       return access;
  //     } else {
  //       return "";
  //     }
  //   } on DioException {
  //     return "";
  //   }
  // }

  Future<Response> get(String url) async {
    return dio.get(url);
  }

  Future<Response> post(String url, {dynamic data}) {
    return dio.post(url, data: data);
  }

  Future<Response> put(String url, {dynamic data}) {
    return dio.put(url, data: data);
  }

  Future<Response> patch(String url, {dynamic data}) {
    return dio.patch(url, data: data);
  }

  Future<Response> delete(String url) async {
    return dio.delete(url);
  }
}
