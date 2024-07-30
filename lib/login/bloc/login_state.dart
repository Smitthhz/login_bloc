part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginLoadedState extends LoginState {
  final LoginResModel loginResModel;

  LoginLoadedState({required this.loginResModel});
}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});

}
