import 'package:attendance_bloc/Screens/auth/controller/login_controller.dart';
import 'package:attendance_bloc/core/core_controller.dart';
import 'package:attendance_bloc/datasource/local/local_extra_storage_service.dart';
import 'package:attendance_bloc/datasource/local/local_token_service.dart';
import 'package:attendance_bloc/datasource/local/local_user_service.dart';
import 'package:attendance_bloc/datasource/remote/auth/login_service.dart';
import 'package:attendance_bloc/datasource/remote/notification/notification_service.dart';
import 'package:attendance_bloc/Screens/auth/data/repo/login_repository_impl.dart';
import 'package:attendance_bloc/Screens/notification/data/repoImpl/notification_repository_impl.dart';
import 'package:attendance_bloc/Screens/auth/domain/repo/login_repository.dart';
import 'package:attendance_bloc/core/base_remote_service.dart';
import 'package:attendance_bloc/Screens/notification/domain/repo/notification_repository.dart';
import 'package:attendance_bloc/Screens/auth/domain/usecase/login_usecase.dart';
import 'package:attendance_bloc/Screens/notification/domain/usecase/notification_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  //core controller
  locator.registerLazySingleton<CoreController>(() => CoreController());

  //base service singleton instance
  locator.registerLazySingleton<BaseRemoteServices>(() => BaseRemoteServices());
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPref);

  //local service singleton instance
  //extra storage
  locator.registerFactory<LocalExtraStorageService>(() => LocalExtraStorageServiceImpl());
  //user
  locator.registerFactory<LocalUserService>(() => LocalUserServiceImpl());
  //access token
  locator.registerFactory<LocalAccessTokenService>(() => LocalAccessTokenServiceImpl());

  //remote service singleton instance
  //>>login
  //repo
  locator.registerFactory<LoginUserRepo>(() => LoginUserRepoImpl());
  //service
  locator.registerFactory<LoginService>(() => LoginServiceImpl());
  //usecase
  locator.registerFactory<LoginUsecase>(() => LoginUsecase());
  //controller
  locator.registerFactory<LoginController>(() => LoginController());

  //notification
  locator.registerFactory<NotificationRepo>(() => NotificationRepoImpl());
  locator.registerFactory<NotificationService>(() => NotificationServiceImpl());
  locator.registerFactory<NotificationUsecase>(() => NotificationUsecase());

  // locator.registerLazySingleton<NotificationService>(
  //     () => NotificationServiceImpl(baseRemoteServices: dioWithAuth));

  // locator.registerLazySingleton<NotificationRepo>(
  //     () => NotificationRepoImpl(locator<NotificationService>()));
  // locator.registerFactory(() => NotificationBloc(locator.get<>()));

  // locator.registerSingleton<NotificationService>(
  //   NotificationService(),
  // );

  // locator.registerSingleton<NotificationRepo>(
  //   NotificationRepoImpl(locator<NotificationService>()),
  // );
}
