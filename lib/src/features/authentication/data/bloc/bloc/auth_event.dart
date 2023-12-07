part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthInitialize extends AuthEvent {}

class AuthRegisterRequest extends AuthEvent {
  final RequestJsonDataModel model;
  AuthRegisterRequest(this.model);
}

class AuthLoginRequest extends AuthEvent {
  final RequestJsonDataModel model;
  AuthLoginRequest(this.model);
}
