import 'package:shopware_6/feature_products/domain/repositories/products_repository.dart';

class GetProductsUsecase {
  final ProductsRepository repository;

  const GetProductsUsecase(this.repository);

  Future<List<String>> call(GetProductsParams params) async {
    return await repository.getProducts();
  }
}

class GetProductsParams {
  final int page;

  const GetProductsParams(this.page);
}
