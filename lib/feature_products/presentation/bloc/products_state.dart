part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.loading() = _Loading;

  const factory ProductsState.loaded({
    required List<String> products,
  }) = _Loaded;

  const factory ProductsState.error(String error) = _Error;
}
