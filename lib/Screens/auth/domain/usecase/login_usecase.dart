import 'package:attendance_bloc/core/base_remote_service.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/datasource/local/local_token_service.dart';
import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:attendance_bloc/Screens/auth/domain/repo/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  Future<Either<Failure, AccessToken>> loginUser(
      {required String userName, required String password}) async {
    final response = await locator<LoginUserRepo>().login(
      userName: userName,
      password: password,
    );
    if (response.isRight()) {
      final accessToken = response.getOrElse(() => const AccessToken());
      locator<BaseRemoteServices>().updateAuthorization(
        accessToken.access!,
      );
      await locator<LocalAccessTokenService>().saveAccessToken(accessToken);
      // await serviceLocator<UserCacheService>().saveUser(remoteUser);
    }
    return response;
  }
}
