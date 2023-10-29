import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/base_remote_service.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:attendance_bloc/utils/constants/apis.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class LoginService {
  Future<Either<Failure, AccessToken>> loginUser({
    required String username,
    required String password,
  });
}

class LoginServiceImpl implements LoginService {
  final BaseRemoteServices _baseRemoteServices = locator<BaseRemoteServices>();

  @override
  Future<Either<Failure, AccessToken>> loginUser({
    required String username,
    required String password,
  }) async {
    // call request here
    var formData = FormData.fromMap({
      "email": username,
      "password": password,
      'firebase_token': "",
    });

    try {
      final response = await _baseRemoteServices.post(Apis.loginPath, data: formData);
      if (response.statusCode == 200) {
        return Right(AccessToken.fromJson(response.data));
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      CustomLogger.trace("LoginServiceImplError $e");
      return const Left(
        Exception('Exception Occured in LoginRemoteDataSourceImpl'),
      );
    }
  }
}
