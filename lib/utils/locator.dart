import 'package:attendance_bloc/domain/repositories/notification_repository.dart';
import 'package:attendance_bloc/data/datasource/base_service.dart';
import 'package:attendance_bloc/data/datasource/remote/notification_service.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/notification_repository_impl.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<BaseRemoteServices>(
    BaseRemoteServices(),
  );
  locator.registerSingleton<NotificationService>(
    NotificationService(),
  );

  locator.registerSingleton<NotificationRepo>(
    NotificationRepoImpl(locator<NotificationService>()),
  );
}
