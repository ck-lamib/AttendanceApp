import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/datasource/remote/auth/login_service.dart';
import 'package:attendance_bloc/Screens/auth/domain/repo/login_repository.dart';
import 'package:attendance_bloc/models/user_model.dart';
import 'package:dartz/dartz.dart';

class LoginUserRepoImpl implements LoginUserRepo {
  @override
  Future<Either<Failure, UserAccessToken>> login(
      {required String email, required String password}) {
    return locator<LoginService>().loginUser(
      email: email,
      password: password,
    );
  }
}
