import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/datasource/remote/notification/notification_service.dart';
import 'package:attendance_bloc/models/notification_model.dart';
import 'package:attendance_bloc/Screens/notification/domain/repo/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<Either<Failure, NotificationList>> getNotifications() {
    return locator<NotificationService>().getNotifications();
  }
}
