import 'package:shopware_6/feature_products/domain/entities/product_page_entity.dart';
import 'package:shopware_6/feature_products/domain/repositories/products_repository.dart';

class GetProductsUsecase {
  final ProductsRepository repository;

  const GetProductsUsecase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}

class GetProductsParams {
  const GetProductsParams();
}
