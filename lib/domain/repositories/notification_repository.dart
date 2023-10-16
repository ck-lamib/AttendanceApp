import '../../utils/resources/data_state.dart';

abstract class NotificationRepo {
  Future<DataState> getNotifications();
}
