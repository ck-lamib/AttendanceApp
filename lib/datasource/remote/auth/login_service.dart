import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/base_remote_service.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:attendance_bloc/models/user_model.dart';
import 'package:attendance_bloc/utils/constants/apis.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class LoginService {
  Future<Either<Failure, UserAccessToken>> loginUser({
    required String email,
    required String password,
  });
}

class LoginServiceImpl implements LoginService {
  final BaseRemoteServices _baseRemoteServices = locator<BaseRemoteServices>();

  @override
  Future<Either<Failure, UserAccessToken>> loginUser({
    required String email,
    required String password,
  }) async {
    // call request here
    var formData = FormData.fromMap({
      "email": email,
      "password": password,
    });

    try {
      final response = await _baseRemoteServices.post(Apis.loginPath, data: formData);
      if (response.statusCode == 200) {
        return Right(
          UserAccessToken(
            user: User.fromJson(response.data),
            accessToken: AccessToken.fromJson(
              response.data["token"],
            ),
          ),
        );
      } else {
        return Left(ConnectionFailure(response.data));
      }
    } catch (e) {
      CustomLogger.trace("LoginServiceImplError $e");
      if (e is DioException) {
        print(e.response?.data['message']);
        return Left(handleDioExceptionError(e));
      }
      return const Left(
        Exception('User side error'),
      );
    }
  }
}
