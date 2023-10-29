part of 'notification_bloc.dart';

enum NotificationStatus { initial, success, error, loading }

class NotificationState extends Equatable {
  final NotificationStatus status;
  final NotificationList notificationList;
  const NotificationState({
    this.status = NotificationStatus.initial,
    this.notificationList = const <Notification>[],
  });

  NotificationState copyWith({
    NotificationStatus? status,
    NotificationList? notificationList,
  }) {
    return NotificationState(
        status: status ?? this.status, notificationList: notificationList ?? this.notificationList);
  }

  @override
  List<Object> get props => [status, notificationList];
}

// final class NotificationInitial extends NotificationState {}
// final class NotificationLoading extends NotificationState {}
// final class NotificationInitial extends NotificationState {}
// final class NotificationInitial extends NotificationState {}
