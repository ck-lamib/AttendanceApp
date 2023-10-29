import 'dart:async';

import 'package:attendance_bloc/core/di.dart';
import 'package:attendance_bloc/models/notification_model.dart';
import 'package:attendance_bloc/Screens/notification/domain/usecase/notification_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<GetNotificationEvent>(_mapGetNotificationEventToState);
  }

  FutureOr<void> _mapGetNotificationEventToState(
      GetNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(
      state.copyWith(
        status: NotificationStatus.loading,
      ),
    );
    var result = await locator<NotificationUsecase>().getNotification();

    result.fold((failure) {
      emit(state.copyWith(status: NotificationStatus.error));
    }, (data) {
      emit(
        state.copyWith(
          status: NotificationStatus.success,
          notificationList: data,
        ),
      );
    });
  }
}
