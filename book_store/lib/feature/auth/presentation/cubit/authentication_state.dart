part of 'authentication_cubit.dart';

 class AuthenticationState {
  final EnAction? enCurrentAction;
  final EnStatus enCurrentStatus;
  final String?errorMessage; // error state
  final UserModel ?currentUser;// register,login (success)

 const AuthenticationState(
     {this.enCurrentAction, this.enCurrentStatus=EnStatus.idle, this.errorMessage,this.currentUser});

   AuthenticationState copyWith({
    EnAction? action,
  EnStatus? status,
  String?error,
   UserModel ?user}
      ){
    return AuthenticationState(enCurrentAction: action??enCurrentAction,
        enCurrentStatus: status??enCurrentStatus,errorMessage: error??errorMessage,currentUser: user??currentUser);
  }

}

