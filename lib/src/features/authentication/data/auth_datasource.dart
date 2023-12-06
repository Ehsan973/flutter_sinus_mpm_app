import 'package:sinus_mpm_application/src/features/authentication/data/models/request_json_data_model.dart';

abstract class IAuthDatasource {
  Future<void> register(RequestJsonDataModel jsonModel);
}

class AuthRemoteDatasource extends IAuthDatasource {
  @override
  Future<void> register(RequestJsonDataModel jsonModel) async {}
}
