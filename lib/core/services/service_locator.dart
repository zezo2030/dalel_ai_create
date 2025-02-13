import 'package:get_it/get_it.dart';
import '../database/cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Cache Helper
  // This registers a singleton instance of CacheHelper that will be lazily initialized
  // when first requested. Using registerLazySingleton means the instance won't be created
  // until it's needed, saving memory. The same instance will be reused for all subsequent
  // requests. This is useful for services like CacheHelper that need to maintain state
  // and should have only one instance throughout the app.
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
