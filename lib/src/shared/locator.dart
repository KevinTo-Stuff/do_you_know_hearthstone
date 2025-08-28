import 'package:get_it/get_it.dart';
import 'package:do_you_know_hearthstone/src/core/routing/app_router.dart';
import 'package:do_you_know_hearthstone/src/shared/services/storage/storage.dart';
import 'package:do_you_know_hearthstone/src/shared/services/storage/local_storage.dart';


final GetIt locator = GetIt.instance
   ..registerLazySingleton(() => AppRouter())
   ..registerLazySingleton<Storage>(() => LocalStorage());