import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/notification_model.dart';
import 'package:attendance_bloc/Screens/notification/domain/repo/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationUsecase {
  Future<Either<Failure, NotificationList>> getNotification() async {
    final response = await locator<NotificationRepo>().getNotifications();
    // if (response.isRight()) {
    //   final notificationList = response.getOrElse(() => <Notification>[]);

    // }

    return response;
  }
}
