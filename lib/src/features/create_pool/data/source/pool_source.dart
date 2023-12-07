import 'package:faker/faker.dart';

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
}

class RemotePoolSource implements IPoolDataSource {
  @override
  Future<UserModel> getUserInfoByUsername(String username) async {
    // return await RemoteSourceHelper()
    //     .getRequest(
    //     url: ReqUrls.beautyCenterSearch,
    //     queryParameters: queryModel.toMap())
    //     .then((value) {
    //   return CommonSearchModel.fromJson(value.data);
    // }).onError((error, stackTrace) => throw error!);
    final waitTime = await Future.delayed(const Duration(seconds: 2));
    return UserModel(
        name: faker.person.name(), username: username, picPath: 'null');
  }
}
