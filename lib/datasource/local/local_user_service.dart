import 'dart:convert';

import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/access_token_model.dart';

import 'package:attendance_bloc/models/user_model.dart';
import 'package:attendance_bloc/utils/helpers/database_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

// abstract class DatabaseService {
//   //user
//   Either<Failure, User> getUser();
//   Future<void> saveUser(User user);

//   //token
//   Either<Failure, AccessToken> getToken();
//   Future<void> saveToken(AccessToken accessToken);
// }

abstract class LocalUserService {
  Either<Failure, User> getUser();
  Future<void> saveUser(User user);
  Future<void> deleteUser();
}

class LocalUserServiceImpl extends LocalUserService {
  @override
  Either<Failure, User> getUser() {
    try {
      String userData = locator<SharedPreferences>().getString(localUserKey) ?? "";
      if (userData == "") {
        return const Left(LocalDatabaseQueryFailure("no user found"));
      } else {
        return Right(User.fromJson(jsonDecode(userData)));
      }
    } catch (e) {
      CustomLogger.trace("localuserserviceimpl $e");
      return const Left(
        Exception('Exception Occured in localserviceImpl'),
      );
    }
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      String userData = jsonEncode(user);
      await locator<SharedPreferences>().setString(localUserKey, userData);
    } catch (e) {
      CustomLogger.trace("localuserserviceimpl $e");
    }
  }

  @override
  Future<void> deleteUser() async {
    await locator<SharedPreferences>().remove(localUserKey);
  }
}
