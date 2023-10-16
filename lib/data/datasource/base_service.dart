import 'dart:developer';

import 'package:dio/dio.dart';

import '../../main.dart';

class BaseRemoteServices {
  final bool showLoading;
  final bool authRequired;

  Dio dio = Dio();
  CancelToken cancelToken = CancelToken();

  // Future<String> getAccessKey() async {
  //   AppStorage storage = AppStorage();
  //   // print(await storage.readAccessKey());
  //   return "Bearer ${await storage.readAccessKey()}";
  // }

  // Future<String> getRefreshKey() async {
  //   AppStorage storage = AppStorage();
  //   return await storage.readRefreshKey();
  // }

  BaseRemoteServices({
    this.showLoading = false,
    this.authRequired = true,
  }) {
    // dio.options.sendTimeout = const Duration(minutes: 1);
    // dio.options.connectTimeout = const Duration(minutes: 1);
    // dio.options.receiveTimeout = const Duration(minutes: 1);
    dio.options.sendTimeout = const Duration(seconds: 30);
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    // dio.interceptors.add(LogInterceptor(responseBody: false, error: true));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          log("${options.method} Request for ${options.uri.toString()}");
          // if (authRequired && (await getAccessKey()).trim() != "Bearer") {
          //   options.headers["Authorization"] = await getAccessKey();
          // }
          options.cancelToken = cancelToken;
          options.headers["Accept"] = '*/*';
          // showLoading ? loadingDialog() : () {};
          // options.receiveTimeout = const Duration(minutes: 1);
          // options.sendTimeout = const Duration(minutes: 1);
          // options.receiveTimeout = const Duration(minutes: 1);
          options.receiveTimeout = const Duration(seconds: 30);
          options.sendTimeout = const Duration(seconds: 30);
          options.receiveTimeout = const Duration(seconds: 35);
          return handler.next(options);
        },
        onResponse: (e, handler) async {
          if (showLoading) {
            navigatorKey.currentState!.pop();
          }
          return handler.next(e);
        },
        onError: (e, handler) async {
          log("=======>>error due to message: ${e.message}");
          log("=======>>error due to path: ${e.requestOptions.path}");
          log("=======>>> stack tace ${e.stackTrace}");

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

  Future<Response> post(String url, dynamic data) {
    return dio.post(url, data: data);
  }

  Future<Response> put(String url, dynamic data) {
    return dio.put(url, data: data);
  }

  Future<Response> patch(String url, dynamic data) {
    return dio.patch(url, data: data);
  }

  Future<Response> delete(String url) async {
    return dio.delete(url);
  }
}
