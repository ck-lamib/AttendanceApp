// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class Exception extends Failure {
  const Exception(String message) : super(message);
}

class LocalDatabaseQueryFailure extends Failure {
  const LocalDatabaseQueryFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(String message) : super(message);
}

Failure handleDioExceptionError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return const Exception("Connection timeout error");
    case DioExceptionType.sendTimeout:
      return const Exception("Send timeout error");
    case DioExceptionType.receiveTimeout:
      return const Exception("Receive timeout error");

    case DioExceptionType.connectionError:
      return const Exception("Connection error");

    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Exception(error.response!.statusMessage!);
      } else {
        return const Exception("Response is null");
      }
    case DioExceptionType.cancel:
      return const Exception("Request Canceled");
    default:
      return const Exception("Unknown Error");
  }
}

// enum DataSource {
//   SUCCESS,
//   NO_CONTENT,
//   BAD_REQUEST,
//   FORBIDDEN,
//   UNAUTORISED,
//   NOT_FOUND,
//   INTERNAL_SERVER_ERROR,
//   CONNECT_TIMEOUT,
//   CANCEL,
//   RECIEVE_TIMEOUT,
//   SEND_TIMEOUT,
//   CACHE_ERROR,
//   NO_INTERNET_CONNECTION,
//   DEFAULT
// }

// extension DataSourceExtension on DataSource {
//   Failure getFailure() {
//     switch (this) {
//       case DataSource.SUCCESS:
//         return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
//       case DataSource.NO_CONTENT:
//         return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
//       case DataSource.BAD_REQUEST:
//         return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
//       case DataSource.FORBIDDEN:
//         return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
//       case DataSource.UNAUTORISED:
//         return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
//       case DataSource.NOT_FOUND:
//         return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
//       case DataSource.INTERNAL_SERVER_ERROR:
//         return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);
//       case DataSource.CONNECT_TIMEOUT:
//         return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
//       case DataSource.CANCEL:
//         return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
//       case DataSource.RECIEVE_TIMEOUT:
//         return Failure(ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
//       case DataSource.SEND_TIMEOUT:
//         return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
//       case DataSource.CACHE_ERROR:
//         return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
//       case DataSource.NO_INTERNET_CONNECTION:
//         return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
//       case DataSource.DEFAULT:
//         return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
//     }
//   }
// }

// class ResponseCode {
//   static const int SUCCESS = 200; // success with data
//   static const int NO_CONTENT = 201; // success with no data (no content)
//   static const int BAD_REQUEST = 400; // failure, API rejected request
//   static const int UNAUTORISED = 401; // failure, user is not authorised
//   static const int FORBIDDEN = 403; //  failure, API rejected request
//   static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
//   static const int NOT_FOUND = 404; // failure, not found

//   // local status code
//   static const int CONNECT_TIMEOUT = -1;
//   static const int CANCEL = -2;
//   static const int RECIEVE_TIMEOUT = -3;
//   static const int SEND_TIMEOUT = -4;
//   static const int CACHE_ERROR = -5;
//   static const int NO_INTERNET_CONNECTION = -6;
//   static const int DEFAULT = -7;
// }

// class ResponseMessage {
//   static const String SUCCESS = "Success with data";
//   static const String NO_CONTENT = "Success with no data (no content)";
//   static const String BAD_REQUEST = "API rejected request";
//   static const String UNAUTORISED = "User is not authorised";
//   static const String FORBIDDEN = "API rejected request";
//   static const String INTERNAL_SERVER_ERROR = "Crash in server side";
//   static const String NOT_FOUND = "Crash in server side";

//   // local status code
//   static const String CONNECT_TIMEOUT = "Connection Timeout for the request";
//   static const String CANCEL = "Cancled";
//   static const String RECIEVE_TIMEOUT = "Recieve Timeout for the request";
//   static const String SEND_TIMEOUT = "Send Timeout for the request";
//   static const String CACHE_ERROR = "Cache error";
//   static const String NO_INTERNET_CONNECTION = "No internet Connection";
//   static const String DEFAULT = "Error";
// }
