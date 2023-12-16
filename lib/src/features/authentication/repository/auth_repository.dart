import 'package:dartz/dartz.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/auth_datasource.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/models/request_json_data_model.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(RequestJsonDataModel jsonModel);
  Future<Either<String, String>> login(RequestJsonDataModel jsonDataModel);
}

class AuthRepository extends IAuthRepository {
  final IAuthDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(
      RequestJsonDataModel jsonModel) async {
    try {
      await _datasource.register(jsonModel);
      return right('ثبت نام انجام شد');
    } on ClientException catch (ex) {
      return left(ex.response['message']);
    } catch (ex) {
      return left(ex.toString());
    }
  }

  @override
  Future<Either<String, String>> login(
      RequestJsonDataModel jsonDataModel) async {
    try {
      var token = await _datasource.login(jsonDataModel);
      return right(token);
    } on ClientException catch (ex) {
      return left(ex.response['message']);
    } catch (ex) {
      return left(ex.toString());
    }
  }
}
