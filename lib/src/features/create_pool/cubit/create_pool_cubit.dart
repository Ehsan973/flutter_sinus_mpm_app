import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/config/utils/messages.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/source/pool_source.dart';

import '../data/repo/pool_repo.dart';

part 'create_pool_state.dart';

class CreatePoolCubit extends Cubit<CreatePoolState> {
  final List<UserModel> addedUsersList = [];
  final TextEditingController userAmount = TextEditingController();
  final IPoolRepo iPoolRepo;

  CreatePoolCubit(this.iPoolRepo) : super(CreatePoolInitial());

  Future<void> getUserInfoByUsername(
    String username,
  ) async {
    emit(CreatePoolLoading());
    final response = await iPoolRepo.getUserInfoByUsername(username);
    response.fold(
      (l) => emit(CreatePoolError(l)),
      (r) {
        emit(CreatePoolInitial(lastCreatedUser: r));
      },
    );
  }

  Future<void> addCurrentUser(
    UserModel lastCreatedModel,
    BuildContext context,
  ) async {
    emit(CreatePoolLoading());
    if (!addedUsersList.contains(lastCreatedModel)) {
      addedUsersList.add(
        lastCreatedModel.copyWith(
          int.parse(
            userAmount.text.replaceAll(',', ''),
          ),
        ),
      );
      AppMessages.showToast(context, message: 'کاربر با موفقیت اضافه شد');
      emit(
        CreatePoolInitial(lastCreatedUser: addedUsersList.last),
      );
    }else {
      AppMessages.showToast(context,message: 'این کاربر رو قبلا اضافه کردی ! ');
    }
  }

  Future<void> removeCurrentUser(UserModel item) async {
    emit(CreatePoolLoading());

    addedUsersList.remove(item);

    emit(CreatePoolInitial());
  }
}
