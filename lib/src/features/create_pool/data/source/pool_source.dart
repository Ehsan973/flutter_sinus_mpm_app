import 'package:faker/faker.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/config/routes/controller/auth_provider.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/model/assign_pool_md.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/model/pool_model.dart';

class UserModel {
  final String name;
  final String username;
  int? amount;
  final String picPath;

  UserModel(
      {required this.name,
      this.amount,
      required this.username,
      required this.picPath});

  ///currently amount can edited as local.
  UserModel copyWith(int? _) {
    if (_ != null) {
      amount = _;
    }
    return this;
  }
}

abstract class IPoolDataSource {
  Future<UserModel> getUserInfoByUsername(String username);
  Future<PoolModel> createNewPool();
  Future<String> assignPoolMd(List<UserModel> userModels, String transactionId);
  Future<PoolModel> getRelevantTrannsactionPoolInformation(
      String transactionId);

  Future<String> updateUserPool(String id, String status);
}

class RemotePoolSource implements IPoolDataSource {
  final PocketBase _pb = locator.get();
  @override
  Future<UserModel> getUserInfoByUsername(String username) async {
    // return await RemoteSourceHelper()
    //     .getRequest(
    //     url: ReqUrls.beautyCenterSearch,
    //     queryParameters: queryModel.toMap())
    //     .then((value) {
    //   return CommonSearchModel.fromJson(value.data);
    // }).onError((error, stackTrace) => throw error!);

    var data = await _pb.collection('users').getOne(
          username,
        );

    return UserModel(
        name: data.data['name'], username: username, picPath: 'null');
  }

  @override
  Future<PoolModel> createNewPool() async {
    final currentUsername = await AuthProvider().getUsername();

    logSuccess('Creating new pool , Creator is $currentUsername} ');

    var result = await _pb.collection('pools').create(body: {
      "creator": currentUsername,
      "status": "pending",
      "name": "test",
      "description": "test"
    });
    final PoolModel poolModel = PoolModel(
        id: result.id,
        creator: result.data['creator'],
        description: '',
        name: '',
        status: result.data['status']);
    return poolModel;
  }

  @override
  Future<String> assignPoolMd(
      List<UserModel> userModels, String transactionId) async {
    // ignore: avoid_function_literals_in_foreach_calls
    userModels.forEach((element) async {
      logSuccess(
          'Assigning ${element.name} to trnsaction with id $transactionId');
      await _pb.collection('user_pools').create(body: {
        "user_id": element.username,
        "pool_id": transactionId,
        "amount": element.amount,
        "status": "pending"
      });
    });

    return 'success';
  }

  @override
  Future<PoolModel> getRelevantTrannsactionPoolInformation(
      String transactionId) async {
    final currentUserId = await AuthProvider().getUsername();

    final result = await _pb.collection("user_pools").getFirstListItem('',
        expand: 'pool_id',
        query: {"user_id": currentUserId, "pool_id": transactionId});

    final response = await getUserInfoByUsername(
      result.expand.entries.first.value.first.data['creator'],
    );

    return PoolModel(
        id: result.id,
        creator: result.expand.entries.first.value.first.data['creator'],
        description: result.data['description'],
        amount: result.data['amount'],
        name: response.name);
  }

  @override
  Future<String> updateUserPool(String id, String status) async {
    await _pb.collection('user_pools').update(id, body: {"status": status});
    return 'success';
  }
}
