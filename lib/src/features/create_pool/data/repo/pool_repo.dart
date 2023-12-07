import 'package:dartz/dartz.dart';

import '../source/pool_source.dart';

abstract class IPoolRepo {
  Future<Either<String, UserModel>> getUserInfoByUsername(String username);

}

class PoolRepo implements IPoolRepo {
  final IPoolDataSource poolDataSource;

  PoolRepo(this.poolDataSource);

  @override
  Future<Either<String, UserModel>> getUserInfoByUsername(String username) async {
    try {
      final response = await poolDataSource.getUserInfoByUsername(username);
      return right(response);
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }
}
