import 'package:dio/dio.dart';
import 'package:shopware_6/core/api_provider/http_provider.dart';
import 'package:shopware_6/feature_products/data/data_source/remote/products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final HttpProvider apiProvider;

  const ProductsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<String>> getProducts(int page) async {
    final response = await apiProvider.get(
      'character',
      params: {'page': page},
    );

    final res = response as Response<dynamic>;
    //final dto = CharacterPageDto.fromJson(res.data as Map<String, dynamic>);
    return [''];
  }
}
