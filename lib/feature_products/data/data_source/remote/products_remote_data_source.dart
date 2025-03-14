abstract interface class ProductsRemoteDataSource {
  Future<List<String>> getProducts(int page);
}
