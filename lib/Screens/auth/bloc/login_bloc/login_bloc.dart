import 'dart:async';

import 'package:attendance_bloc/Screens/widgets/custom/logger.dart';
import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/Screens/auth/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<SubmitCredentialEvent>(_mapSubmitCredentialEventToState);
    on<TooglePasswordEvent>(_mapTooglePasswordEventToState);
  }

  FutureOr<void> _mapSubmitCredentialEventToState(
      SubmitCredentialEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      status: LoginStatus.loading,
    ));
    var result =
        await locator<LoginUsecase>().loginUser(userName: event.userName, password: event.password);

    result.fold((failure) {
      emit(state.copyWith(
        status: LoginStatus.error,
      ));
    }, (data) {
      CustomLogger.trace(data.toJson());
      emit(state.copyWith(status: LoginStatus.success));
    });
  }

  FutureOr<void> _mapTooglePasswordEventToState(
      TooglePasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordHidden: !event.isHidePassword));
  }
}
