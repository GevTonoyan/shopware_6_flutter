import 'package:get_it/get_it.dart';
import 'package:shopware_6/core/api_provider/dio_provider.dart';
import 'package:shopware_6/core/api_provider/http_provider.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  // Core components
  sl.registerLazySingleton<HttpProvider>(() => DioProvider());

  // Features
}
