part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SubmitCredentialEvent extends LoginEvent {
  final String userName;
  final String password;
  const SubmitCredentialEvent({required this.userName, required this.password});
}

class TooglePasswordEvent extends LoginEvent {
  final bool isHidePassword;
  const TooglePasswordEvent({required this.isHidePassword});
}
