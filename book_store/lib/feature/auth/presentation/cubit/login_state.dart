part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess(this.user);
}
final class LoginFailed extends LoginState {
  final String errMessage;
  LoginFailed(this.errMessage);
}
