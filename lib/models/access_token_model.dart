import 'package:equatable/equatable.dart';

class AccessToken extends Equatable {
  final bool? status;
  final String? refresh;
  final String? access;

  const AccessToken({
    this.status,
    this.refresh,
    this.access,
  });

  AccessToken copyWith({
    bool? status,
    String? refresh,
    String? access,
  }) =>
      AccessToken(
        status: status ?? this.status,
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
      );

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      status: json['status'],
      access: json['access'],
      refresh: json['refresh'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['access'] = access;
    data['refresh'] = refresh;
    return data;
  }

  @override
  List<Object?> get props => [status, access, refresh];
}
