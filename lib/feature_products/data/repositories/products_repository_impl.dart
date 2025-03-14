import 'package:shopware_6/feature_products/data/data_source/remote/products_remote_data_source.dart';
import 'package:shopware_6/feature_products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  const ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<String>> getProducts() {
    return remoteDataSource.getProducts(1);
  }
}
