import 'package:rick_and_morty/features/feature_characters/domain/entities/character_page_entity.dart';
import 'package:rick_and_morty/features/feature_characters/domain/repositories/characters_repository.dart';

class GetProductsUsecase {
  final ProductsRepository repository;

  const GetProductsUsecase(this.repository);

  Future<CharacterPageEntity> call(GetProductsParams params) async {
    return await repository.getProducts();
  }
}

class GetProductsParams {
  final int page;

  const GetProductsParams(this.page);
}
