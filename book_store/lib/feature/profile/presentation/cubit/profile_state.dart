part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class GetUserLoading extends ProfileState {}
final class GetUserSuccess extends ProfileState {
  final UserModel userModel;

  GetUserSuccess(this.userModel);
}
final class GetUserFailed extends ProfileState {
  final String error;

  GetUserFailed(this.error);
}
