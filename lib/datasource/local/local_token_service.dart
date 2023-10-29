import 'dart:convert';

import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:attendance_bloc/utils/helpers/database_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalAccessTokenService {
  Either<Failure, AccessToken> getAccessToken();
  Future<void> saveAccessToken(AccessToken accessToken);
  Future<void> deleteAccessToken();
}

class LocalAccessTokenServiceImpl implements LocalAccessTokenService {
  @override
  Either<Failure, AccessToken> getAccessToken() {
    try {
      String accessToken = locator<SharedPreferences>().getString(localAccessTokenKey) ?? "";
      if (accessToken == "") {
        return const Left(LocalDatabaseQueryFailure("no token found"));
      } else {
        return Right(AccessToken.fromJson(jsonDecode(accessToken)));
      }
    } catch (e) {
      CustomLogger.trace("localaccesstokenserviceimpl $e");
      return const Left(
        Exception('Exception Occured in accessTokenserviceImpl'),
      );
    }
  }

  @override
  Future<void> saveAccessToken(AccessToken accessToken) async {
    try {
      String accessTokenData = jsonEncode(accessToken);
      await locator<SharedPreferences>().setString(localAccessTokenKey, accessTokenData);
    } catch (e) {
      CustomLogger.trace("localaccessTokenserviceimpl $e");
    }
  }

  @override
  Future<void> deleteAccessToken() async {
    await locator<SharedPreferences>().remove(localAccessTokenKey);
  }
}
