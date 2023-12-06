import 'package:pocketbase/pocketbase.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/models/request_json_data_model.dart';

abstract class IAuthDatasource {
  Future<void> register(RequestJsonDataModel jsonModel);
}

class AuthRemoteDatasource extends IAuthDatasource {
  final PocketBase _pb = locator.get();

  @override
  Future<void> register(RequestJsonDataModel jsonModel) async {
    final body = <String, dynamic>{
      "username": "${jsonModel.username}",
      "password": "${jsonModel.password}",
      "passwordConfirm": "${jsonModel.passwordConfirm}",
    };

    final record = await _pb.collection('users').create(body: body);
  }
}
