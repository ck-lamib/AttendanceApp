import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUserRepo {
  Future<Either<Failure, AccessToken>> login({required String userName, required String password});
}
