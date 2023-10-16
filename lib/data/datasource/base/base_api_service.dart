import 'package:dio/dio.dart';

// import 'package:retrofit/retrofit.dart';

import '../../../utils/resources/data_state.dart';

abstract class BaseApiService {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully recieved.
  ///
  /// Returns `DataFailed` that holds a `DioError` instance if any error occurs
  /// while sending the request or recieving the response.
  ///
  Future<DataState<T>> getStateOf<T>({
    // required Future<Response<T>> Function() request,
    required Future<Response> Function() request,
  }) async {
    try {
      final response = await request();
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return DataSuccess(response.data as T);
      } else {
        throw DioException(
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
