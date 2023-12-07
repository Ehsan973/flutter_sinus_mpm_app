part of 'create_pool_cubit.dart';

@immutable
abstract class CreatePoolState {}

class CreatePoolInitial extends CreatePoolState {

  final UserModel? lastCreatedUser;

  CreatePoolInitial({this.lastCreatedUser});

}

class CreatePoolLoading extends CreatePoolState {}


class CreatePoolError extends CreatePoolState {
  final String errorMessage;

  CreatePoolError(this.errorMessage);
}
