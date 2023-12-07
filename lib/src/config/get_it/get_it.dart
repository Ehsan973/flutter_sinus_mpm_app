import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/auth_datasource.dart';
import 'package:sinus_mpm_application/src/features/authentication/repository/auth_repository.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/repo/pool_repo.dart';
import 'package:sinus_mpm_application/src/features/create_pool/data/source/pool_source.dart';

final locator = GetIt.instance;

Future<void> configureDi() async {
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  locator.registerLazySingleton(() => PocketBase('http://192.168.8.249:8090/'));
  locator.registerLazySingleton<IPoolRepo>(() => PoolRepo(RemotePoolSource()));
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<IAuthDatasource>(() => AuthRemoteDatasource());
}
