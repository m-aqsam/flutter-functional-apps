import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonNavigateClickedEvent>(loginButtonNavigateClickedEvent);
    on<LoginCreateAccountNavigateClickedEvent>(
        loginCreateAccountNavigateClickedEvent);
  }

  FutureOr<void> loginButtonNavigateClickedEvent(
      LoginButtonNavigateClickedEvent event, Emitter<LoginState> emit) {
    print("Login Button Clicked");
  }

  FutureOr<void> loginCreateAccountNavigateClickedEvent(
      LoginCreateAccountNavigateClickedEvent event, Emitter<LoginState> emit) {
    print("Create Account Button Clicked");
  }
}
