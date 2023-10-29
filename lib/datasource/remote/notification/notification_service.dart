import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/core/failure.dart';
import 'package:attendance_bloc/models/notification_model.dart';
import 'package:attendance_bloc/utils/constants/apis.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_remote_service.dart';

abstract class NotificationService {
  NotificationService();
  Future<Either<Failure, NotificationList>> getNotifications();
}

class NotificationServiceImpl implements NotificationService {
  final BaseRemoteServices _baseRemoteServices = locator<BaseRemoteServices>();
  @override
  Future<Either<Failure, NotificationList>> getNotifications() async {
    try {
      final response = await _baseRemoteServices.get(Apis.notificationPath);
      if (response.statusCode == 200) {
        return Right(notificationListFromJson(response.data['results']));
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      CustomLogger.trace("notificationserviceimpl $e");
      return const Left(
        Exception('Exception Occured in notificationserviceImpl'),
      );
    }
  }
}
