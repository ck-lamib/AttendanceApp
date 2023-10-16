import 'package:attendance_bloc/data/datasource/remote/notification_service.dart';
import 'package:attendance_bloc/data/repositories/base/base_api_service.dart';
import 'package:attendance_bloc/domain/models/notification_model.dart';
import 'package:attendance_bloc/domain/repositories/notification_repository.dart';
import 'package:attendance_bloc/utils/resources/data_state.dart';

class NotificationRepoImpl extends BaseApiService implements NotificationRepo {
  final NotificationService _notificationService;

  NotificationRepoImpl(this._notificationService);

  @override
  Future<DataState<NotificationList>> getNotifications() {
    return getStateOf<NotificationList>(request: _notificationService.getNotifications);
  }
}
