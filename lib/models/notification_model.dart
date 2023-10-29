import 'package:equatable/equatable.dart';

typedef NotificationList = List<Notification>;

NotificationList notificationListFromJson(List<dynamic> notificationsJson) => NotificationList.from(
    notificationsJson.map((notificationJson) => Notification.fromJson(notificationJson)));

class Notification extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? type;

  const Notification({
    this.id,
    this.description,
    this.type,
    this.title,
  });

  Notification copyWith({
    int? id,
    String? title,
    String? description,
    String? type,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    return data;
  }

  @override
  List<Object?> get props => [id, title, description, type];
}
