import 'package:attendance_bloc/core/base_remote_service.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/datasource/local/local_token_service.dart';
import 'package:attendance_bloc/datasource/local/local_user_service.dart';

import 'package:attendance_bloc/Screens/auth/domain/repo/login_repository.dart';
import 'package:attendance_bloc/models/user_model.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  Future<Either<Failure, UserAccessToken>> loginUser(
      {required String email, required String password}) async {
    final response = await locator<LoginUserRepo>().login(
      email: email,
      password: password,
    );
    if (response.isRight()) {
      final userAccessToken = response.getOrElse(() => UserAccessToken());
      locator<BaseRemoteServices>().updateAuthorization(userAccessToken.accessToken!.access!);
      await locator<LocalUserService>().saveUser(userAccessToken.user!);
      await locator<LocalAccessTokenService>().saveAccessToken(userAccessToken.accessToken!);
      // await serviceLocator<UserCacheService>().saveUser(remoteUser);
    }
    return response;
  }
}
