part of 'create_pool_cubit.dart';

@immutable
abstract class CreatePoolState {}

class CreatePoolInitial extends CreatePoolState {
  final UserModel? lastCreatedUser;
  final PoolModel? poolModel;
 final  String? currentUserUserName;
  CreatePoolInitial(
      {this.lastCreatedUser, this.poolModel, this.currentUserUserName});
}

class CreatePoolLoading extends CreatePoolState {}

class CreatePoolError extends CreatePoolState {
  final String errorMessage;

  CreatePoolError(this.errorMessage);
}
