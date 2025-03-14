import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_dto.freezed.dart';

part 'products_dto.g.dart';

@freezed
class ProductsDto with _$ProductsDto {
  const factory ProductsDto({
    required List<ProductDto> elements,
  }) = _ProductsDto;

  factory ProductsDto.fromJson(Map<String, dynamic> json) => _$ProductsDtoFromJson(json);
}

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    @Default('') String name,
    @Default('') String description,
    @Default(0.0) double price,
    @Default('') String imageUrl,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
}
