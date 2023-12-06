part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthRegisterRequest extends AuthEvent {
  final RequestJsonDataModel model;
  AuthRegisterRequest(this.model);
}
