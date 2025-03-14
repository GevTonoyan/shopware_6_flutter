import 'package:shopware_6/core/dependency_injection/dependency_injection.dart';
import 'package:shopware_6/feature_products/data/data_source/remote/products_remote_data_source.dart';
import 'package:shopware_6/feature_products/data/data_source/remote/products_remote_data_source_impl.dart';
import 'package:shopware_6/feature_products/data/repositories/products_repository_impl.dart';
import 'package:shopware_6/feature_products/domain/repositories/products_repository.dart';
import 'package:shopware_6/feature_products/domain/usecases/get_products_usecase.dart';

Future<void> injectProductsScope() async {
  // bloc
  // sl.registerFactory<CharactersStore>(
  //   () => CharactersStore(
  //     getCharactersUsecase: sl(),
  //     getLikedCharactersUseCase: sl(),
  //     toggleLikedCharacterUseCase: sl(),
  //   ),
  // );

  // use cases
  sl.registerLazySingleton<GetProductsUsecase>(
    () => GetProductsUsecase(sl()),
  );

  // repositories
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(remoteDataSource: sl()),
  );

  // data sources

  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(apiProvider: sl()),
  );

  // mappers
  // sl.registerLazySingleton<CharacterPageMapper>(
  //   () => CharacterPageMapperImpl(),
  // );
}
