import 'package:attendance_bloc/utils/constants/apis.dart';
import 'package:dio/dio.dart';

import '../base_service.dart';

class NotificationService {
  final bool authRequired;
  final bool showLoading;

  late final BaseRemoteServices _baseRemoteServices;
  final String url = Apis.notificationPath;

  NotificationService({
    this.authRequired = false,
    this.showLoading = false,
  }) : _baseRemoteServices = BaseRemoteServices(
          authRequired: authRequired,
          showLoading: showLoading,
        );

  Future<Response> getNotifications() {
    return _baseRemoteServices.get(url);
  }
}
