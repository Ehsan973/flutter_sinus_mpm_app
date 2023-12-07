import 'package:dartz/dartz.dart';

import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';

abstract class IProfileRepository {
  Future<Either<String, String>> getAddWallet();
}

class ProfileRepository extends IProfileRepository {
  final IProfileRepository _datasource = locator.get();

  @override
  Future<Either<String, String>> getAddWallet() {}
}
