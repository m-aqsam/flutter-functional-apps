part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginInitialEvent extends LoginEvent {}

final class LoginButtonNavigateClickedEvent extends LoginEvent {}

final class LoginCreateAccountNavigateClickedEvent extends LoginEvent {}
