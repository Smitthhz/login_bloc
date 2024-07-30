part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginReqEvent extends LoginEvent {
  // final String username;
  // final String password;
  final LoginReqModel loginReqModel;
  LoginReqEvent({required this.loginReqModel});

}
