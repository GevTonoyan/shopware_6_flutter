import 'package:dio/dio.dart';
import 'package:shopware_6/core/api_provider/http_provider.dart';
import 'package:shopware_6/feature_products/data/data_source/remote/products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final HttpProvider apiProvider;

  const ProductsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<String>> getProducts(int page) async {
    final response = ['111', '222', '333', '444', '555', '666', '777', '888', '999', '000'];

    //final dto = CharacterPageDto.fromJson(res.data as Map<String, dynamic>);
    return response;
  }
}
