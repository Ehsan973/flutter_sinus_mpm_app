import 'package:pocketbase/pocketbase.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';

abstract class IProfileDatasource {
  Future<void> getAddWallet();
}

class ProfileRemoteDatasource extends IProfileDatasource {
  final PocketBase _pb = locator.get();

  @override
  Future<void> getAddWallet() {}
}
