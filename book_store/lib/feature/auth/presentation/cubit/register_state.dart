part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final UserModel user;

  RegisterSuccess(this.user);
}
final class RegisterFailed extends RegisterState {
  final String errMessage;
  RegisterFailed(this.errMessage);
}
