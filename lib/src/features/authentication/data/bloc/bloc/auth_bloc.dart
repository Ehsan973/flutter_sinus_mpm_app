import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/models/request_json_data_model.dart';
import 'package:sinus_mpm_application/src/features/authentication/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitial()) {
    on<AuthRegisterRequest>((event, emit) async {
      emit(AuthLoading());
      var responseEither = await _repository.register(event.model);
      emit(AuthResponse(responseEither));
    });

    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoading());
      var responseEither = await _repository.login(event.model);
      emit(AuthResponse(responseEither));
    });

    on<AuthInitialize>((event, emit) {
      emit(AuthInitial());
    });
  }
}
