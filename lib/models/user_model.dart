import 'package:attendance_bloc/models/access_token_model.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? uuid;
  final String? email;
  final String? fullName;
  final String? phoneNumber;

  final String? gender;
  final bool? isVerified;

  const User({
    this.uuid,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.gender,
    this.isVerified,
  });

  User copyWith({
    String? uuid,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? gender,
    bool? isVerified,
  }) =>
      User(
        uuid: uuid ?? this.uuid,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        isVerified: isVerified ?? this.isVerified,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        email: json["email"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        gender: json["gender"] == "" ? "" : json["gender"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "email": email,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "gender": gender,
        "is_verified": isVerified,
      };

  @override
  List<Object?> get props => [uuid, email, fullName, phoneNumber, gender, isVerified];
}

class UserAccessToken {
  final User? user;
  final AccessToken? accessToken;
  UserAccessToken({this.user, this.accessToken});
}
