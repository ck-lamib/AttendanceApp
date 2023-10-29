import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? fullName;
  final String? gender;
  final bool? isVerified;

  const User({
    this.email,
    this.fullName,
    this.gender,
    this.isVerified,
  });

  User copyWith({
    String? email,
    String? fullName,
    String? gender,
    bool? isVerified,
  }) =>
      User(
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        gender: gender ?? this.gender,
        isVerified: isVerified ?? this.isVerified,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        fullName: json["full_name"],
        gender: json["gender"] == "" ? "" : json["gender"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "full_name": fullName,
        "gender": gender,
        "is_verified": isVerified,
      };

  @override
  List<Object?> get props => [email, fullName, gender, isVerified];
}
