import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/api_provider/dio_provider.dart';
import 'package:rick_and_morty/core/api_provider/http_provider.dart';
import 'package:rick_and_morty/features/feature_character_detail/character_detail_scope.dart';
import 'package:rick_and_morty/features/feature_characters/characters_scope.dart';

final sl = GetIt.instance;

Future<void> setupDependencies()async  {
  // Core components
  sl.registerLazySingleton<HttpProvider>(() => DioProvider());

  // Features

}
