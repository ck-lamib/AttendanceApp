import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationList>> getNotifications();
}
