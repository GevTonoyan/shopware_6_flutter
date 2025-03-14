import 'package:dio/dio.dart';
import 'package:shopware_6/core/api_provider/http_provider.dart';
import 'package:shopware_6/feature_products/data/data_source/remote/products_remote_data_source.dart';
import 'package:shopware_6/feature_products/domain/entities/product_page_entity.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final HttpProvider apiProvider;

  const ProductsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<ProductEntity>> getProducts() async {
    const String baseUrl = 'https://shopware66.armdev.am/store-api';
    Response response = await apiProvider.post(
      '$baseUrl/product-listing/a515ae260223466f8e37471d279e6406',
    );

    if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      final jsonData = response.data;

      final products = (jsonData['elements'] as List)
          .map(
            (product) => ProductEntity(
              id: product['id'] as String,
              name: product['name'] ?? 'Unnamed Product',
              description: product['description'] ?? 'No description available',
              price: (product['calculatedPrice']?['unitPrice'] as num?)?.toDouble() ?? 0.0,
              imageUrl: product['cover']?['media']?['url'] ?? '',
            ),
          )
          .toList();

      return products;
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
