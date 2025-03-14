class ProductsEntity {
  final int count;
  final int pages;
  final List<ProductEntity> products;

  const ProductsEntity({
    required this.count,
    required this.pages,
    required this.products,
  });
}

class ProductEntity {
  final int id;
  final String name;
  final String imageUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
