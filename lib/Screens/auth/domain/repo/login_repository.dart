import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/datasource/remote/auth/login_service.dart';
import 'package:attendance_bloc/models/user_model.dart';

import 'package:dartz/dartz.dart';

abstract class LoginUserRepo {
  Future<Either<Failure, UserAccessToken>> login({required String email, required String password});
}
