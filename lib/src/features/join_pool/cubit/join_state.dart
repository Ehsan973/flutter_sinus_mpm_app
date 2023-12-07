part of 'join_cubit.dart';

@immutable
sealed class JoinState {}

final class JoinInitial extends JoinState {
  final PoolModel? r;
  final bool isUpdated;
  JoinInitial({this.r, this.isUpdated = false});
}

final class JoinLoading extends JoinState {}

final class JoinError extends JoinState {
  final String errorMsg;

  JoinError(this.errorMsg);
}
