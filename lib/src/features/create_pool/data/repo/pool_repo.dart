import 'package:dartz/dartz.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/model/pool_model.dart';

import '../source/pool_source.dart';

abstract class IPoolRepo {
  Future<Either<String, UserModel>> getUserInfoByUsername(String username);
  Future<Either<String, PoolModel>> createNewPool();
  Future<Either<String, PoolModel>> getRelevantTrannsactionPoolInformation(
      String transactionId);
  Future<Either<String, String>> assignPoolMd(
      List<UserModel> userModels, String transactionId);

  Future<Either<String, String>> updateUserPool( 
    String id , 
    String status);
}

class PoolRepo implements IPoolRepo {
  final IPoolDataSource poolDataSource;

  PoolRepo(this.poolDataSource);

  @override
  Future<Either<String, UserModel>> getUserInfoByUsername(
      String username) async {
    try {
      final response = await poolDataSource.getUserInfoByUsername(username);
      return right(response);
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }

  @override
  Future<Either<String, PoolModel>> createNewPool() async {
    try {
      final response = await poolDataSource.createNewPool();
      return right(response);
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }

  @override
  Future<Either<String, String>> assignPoolMd(
      List<UserModel> userModels, String transactionId) async {
    try {
      final response =
          await poolDataSource.assignPoolMd(userModels, transactionId);
      return right(response);
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }

  @override
  Future<Either<String, PoolModel>> getRelevantTrannsactionPoolInformation(
      String transactionId) async {
    try {
      final response = await poolDataSource
          .getRelevantTrannsactionPoolInformation(transactionId);
      return right(response);
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }

  @override
  Future<Either<String, String>> updateUserPool(
    String id ,  String status) async {
    try {
      final response = await poolDataSource.updateUserPool(id,  status);
      return right(response);
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }
}
