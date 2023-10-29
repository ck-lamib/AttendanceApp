import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/datasource/local/local_extra_storage_service.dart';
import 'package:attendance_bloc/datasource/local/local_token_service.dart';
import 'package:attendance_bloc/datasource/local/local_user_service.dart';
import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:attendance_bloc/models/user_model.dart';
import 'package:dartz/dartz.dart';

class CoreController {
  User? currentUser;
  AccessToken? accessToken;
  CoreController() {
    CustomLogger.trace("core controller const called");
    loadCurrentUser();
    isIntroductionPageShown();
  }

  isUserLoggedIn() {
    // return currentUser != null;
    return accessToken != null;
  }

  Future<void> loadCurrentUser() async {
    //getting user
    Either<Failure, User> localUserData = locator<LocalUserService>().getUser();
    localUserData.fold(
      (failed) {
        CustomLogger.trace(failed.message);
        currentUser = null;
      },
      (data) {
        currentUser = data;
      },
    );
    //getting access token
    Either<Failure, AccessToken> localAccessTokenData =
        locator<LocalAccessTokenService>().getAccessToken();
    localAccessTokenData.fold(
      (failed) {
        CustomLogger.trace(failed.message);
        accessToken = null;
      },
      (data) {
        accessToken = data;
      },
    );
  }

  Future<bool> isIntroductionPageShown() async {
    bool isIntroShown = await locator<LocalExtraStorageService>().getIndroductionkeyShown();
    return isIntroShown;
  }

  loggedOut() async {
    // SharedPreferences sharedPreferences = locator<SharedPreferences>();
    await locator<LocalUserService>().deleteUser();
    await locator<LocalAccessTokenService>().deleteAccessToken();
  }
}
