part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

sealed class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

// ********************** LoginActionState **********************

final class LoginNavigateToCreateAccountPageActionState
    extends LoginActionState {}

final class LoginNavigateToLoginPageActionState extends LoginActionState {}
