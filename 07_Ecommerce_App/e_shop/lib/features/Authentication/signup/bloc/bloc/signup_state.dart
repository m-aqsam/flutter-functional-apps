part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}
sealed class SignupActionState extends SignupState {}

final class SignupInitial extends SignupState {}
