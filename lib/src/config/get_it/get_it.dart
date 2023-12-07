import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/repo/pool_repo.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/source/pool_source.dart';

final locator = GetIt.instance;

Future<void> configureDi() async {
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  locator.registerLazySingleton<IPoolRepo>(() => PoolRepo(RemotePoolSource()));
}
