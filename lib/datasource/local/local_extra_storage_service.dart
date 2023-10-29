import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/di.dart';

import 'package:attendance_bloc/utils/helpers/database_keys.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalExtraStorageService {
  Future<bool> getIndroductionkeyShown();
  Future<void> saveIntroductionKeyShown(bool isIntroductionShown);
  Future<void> deleteIntroductionKeyShown();
}

class LocalExtraStorageServiceImpl implements LocalExtraStorageService {
  @override
  Future<bool> getIndroductionkeyShown() async {
    try {
      bool accessToken = locator<SharedPreferences>().getBool(localIntroductionShownKey) ?? false;
      return accessToken;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveIntroductionKeyShown(bool isIntroductionShown) async {
    try {
      await locator<SharedPreferences>().setBool(localIntroductionShownKey, isIntroductionShown);
    } catch (e) {
      CustomLogger.trace("localSaveIntroKeyServiceimpl $e");
    }
  }

  @override
  Future<void> deleteIntroductionKeyShown() async {
    await locator<SharedPreferences>().remove(localIntroductionShownKey);
  }
}
