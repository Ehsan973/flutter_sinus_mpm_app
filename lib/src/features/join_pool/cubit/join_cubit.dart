import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/model/pool_model.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/repo/pool_repo.dart';

part 'join_state.dart';

class JoinCubit extends Cubit<JoinState> {
  final IPoolRepo iPoolRepo;
  PoolModel? r;
  JoinCubit(this.iPoolRepo) : super(JoinInitial());

  getCurrentTransactionInformationForJoin(String s) async {
    emit(JoinLoading());
    final response = await iPoolRepo.getRelevantTrannsactionPoolInformation(s);
    response.fold(
      (l) => emit(JoinError(l)),
      (r) {
        this.r = r;
        emit(JoinInitial(r: r));
      },
    );
  }

  Future<void> updateUserPool(String userPoolId, String status) async {
    emit(JoinLoading());

    final response = await iPoolRepo.updateUserPool(userPoolId, status);
    response.fold(
      (l) => emit(JoinError(l)),
      (r) {
        emit(JoinInitial(r: this.r, isUpdated: true));
      },
    );
  }
}
