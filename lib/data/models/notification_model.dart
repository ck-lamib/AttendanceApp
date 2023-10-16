import 'package:equatable/equatable.dart';

typedef NotificationList = List<Notification>;

NotificationList notificationListFromJson(List<dynamic> notificationsJson) => NotificationList.from(
    notificationsJson.map((notificationJson) => Notification.fromJson(notificationJson)));

class Notification extends Equatable {
  final String? title;
  final String? subtitle;

  const Notification({
    this.title,
    this.subtitle,
  });

  Notification copyWith({
    String? title,
    String? subtitle,
  }) {
    return Notification(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    return data;
  }

  @override
  List<Object?> get props => [title, subtitle];
}
