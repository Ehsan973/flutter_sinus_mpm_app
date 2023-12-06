part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthResponse extends AuthState {
  final Either<String, String> responseEither;
  AuthResponse(this.responseEither);
}
