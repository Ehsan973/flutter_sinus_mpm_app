import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinus_mpm_application/src/config/constants/keys.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/config/utils/messages.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/model/pool_model.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/source/pool_source.dart';

import '../data/repo/pool_repo.dart';

part 'create_pool_state.dart';

class CreatePoolCubit extends Cubit<CreatePoolState> {
  final List<UserModel> addedUsersList = [];
  final TextEditingController userAmount = TextEditingController();
  final IPoolRepo iPoolRepo;
  UserModel? lastUser;
  PoolModel? poolModel;
  String? currentUserIdIdentify;
  CreatePoolCubit(this.iPoolRepo) : super(CreatePoolInitial());

  Future<void> getCurrentUserQrCodeData() async {
    emit(CreatePoolLoading());

    final currentUserId =
        locator.get<SharedPreferences>().getString(usernameKey);
    currentUserIdIdentify = currentUserId;
    emit(
      CreatePoolInitial(
          lastCreatedUser: lastUser,
          poolModel: poolModel,
          currentUserUserName: currentUserIdIdentify),
    );
  }

  Future<void> assignCurrentUsersToCurrentTransaction(
      String transactionId) async {
    emit(CreatePoolLoading());

    final response =
        await iPoolRepo.assignPoolMd(addedUsersList, transactionId);
    response.fold(
      (l) => emit(CreatePoolError(l)),
      (r) {
        emit(
          CreatePoolInitial(
              lastCreatedUser: lastUser,
              poolModel: poolModel,
              currentUserUserName: currentUserIdIdentify),
        );
      },
    );
  }

  Future<void> getUserInfoByUsername(
    String username,
  ) async {
    emit(CreatePoolLoading());
    final response = await iPoolRepo.getUserInfoByUsername(username);
    response.fold(
      (l) => emit(CreatePoolError(l)),
      (r) {
        lastUser = r;

        emit(CreatePoolInitial(
            lastCreatedUser: r, currentUserUserName: currentUserIdIdentify));
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
        CreatePoolInitial(
            lastCreatedUser: addedUsersList.last,
            currentUserUserName: currentUserIdIdentify),
      );
    } else {
      AppMessages.showToast(context,
          message: 'این کاربر رو قبلا اضافه کردی ! ');
    }
  }

  Future<void> removeCurrentUser(UserModel item) async {
    emit(CreatePoolLoading());

    addedUsersList.remove(item);

    emit(
      CreatePoolInitial(
          currentUserUserName: currentUserIdIdentify,
          lastCreatedUser: addedUsersList.isEmpty ? null : addedUsersList.last),
    );
  }

  Future<void> createNewPool() async {
    emit(CreatePoolLoading());

    final response = await iPoolRepo.createNewPool();
    response.fold(
      (l) => emit(CreatePoolError(l)),
      (r) async {
        poolModel = r;
        emit(CreatePoolInitial(
            lastCreatedUser: lastUser,
            poolModel: r,
            currentUserUserName: currentUserIdIdentify));
        await assignCurrentUsersToCurrentTransaction(r.id!);
      },
    );
  }
}
