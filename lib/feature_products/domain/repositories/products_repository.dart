import 'package:shopware_6/feature_products/domain/entities/product_page_entity.dart';

abstract interface class ProductsRepository {
  Future<List<ProductEntity>> getProducts();
}
