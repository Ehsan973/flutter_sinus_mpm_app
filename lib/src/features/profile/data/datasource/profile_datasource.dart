import 'package:pocketbase/pocketbase.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/features/profile/data/models/profile_json_data_model.dart';

abstract class IProfileDatasource {
  Future<void> getAddWallet(ProfileModel profileModel);
}

class ProfileRemoteDatasource extends IProfileDatasource {
  final PocketBase _pb = locator.get();

  @override
  Future<void> getAddWallet(ProfileModel profileModel) async {}
}
