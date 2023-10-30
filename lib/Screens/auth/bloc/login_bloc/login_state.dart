part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final bool isPasswordHidden;

  const LoginState({
    this.status = LoginStatus.initial,
    this.isPasswordHidden = true,
  });
  LoginState copyWith({LoginStatus? status, bool? isPasswordHidden}) {
    return LoginState(
      status: status ?? this.status,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }

  @override
  List<Object> get props => [status, isPasswordHidden];
}
