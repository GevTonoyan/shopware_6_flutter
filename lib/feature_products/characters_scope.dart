import 'package:rick_and_morty/core/dependency_injection/dependency_injection.dart';
import 'package:rick_and_morty/features/feature_characters/data/data_source/local/characters_local_data_source.dart';
import 'package:rick_and_morty/features/feature_characters/data/data_source/local/characters_local_data_source_impl.dart';
import 'package:rick_and_morty/features/feature_characters/data/data_source/remote/characters_remote_data_source.dart';
import 'package:rick_and_morty/features/feature_characters/data/data_source/remote/characters_remote_data_source_impl.dart';
import 'package:rick_and_morty/features/feature_characters/data/models/mappers/character_page_mapper.dart';
import 'package:rick_and_morty/features/feature_characters/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty/features/feature_characters/domain/characters_domain.dart';
import 'package:rick_and_morty/features/feature_characters/domain/usecases/get_liked_characters_usecase.dart';
import 'package:rick_and_morty/features/feature_characters/domain/usecases/toggle_liked_character_usecase.dart';
import 'package:rick_and_morty/features/feature_characters/presentation/mobx/characters_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectCharactersScope() async {
  // mobx
  sl.registerFactory<CharactersStore>(
    () => CharactersStore(
      getCharactersUsecase: sl(),
      getLikedCharactersUseCase: sl(),
      toggleLikedCharacterUseCase: sl(),
    ),
  );

  // use cases
  sl
    ..registerLazySingleton<GetCharactersUsecase>(
      () => GetCharactersUsecase(sl()),
    )
    ..registerLazySingleton<GetLikedCharactersUseCase>(
      () => GetLikedCharactersUseCase(sl()),
    )
    ..registerLazySingleton<ToggleLikedCharacterUseCase>(
      () => ToggleLikedCharacterUseCase(sl()),
    );

  // repositories
  sl.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // data sources
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSourceImpl(
          apiProvider: sl(), characterPageMapper: sl()),
    )
    ..registerLazySingleton<CharactersLocalDataSource>(
      () => CharactersLocalDataSourceImpl(prefs),
    );

  // mappers
  sl.registerLazySingleton<CharacterPageMapper>(
    () => CharacterPageMapperImpl(),
  );
}
