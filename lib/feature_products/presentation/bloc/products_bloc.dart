import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopware_6/feature_products/domain/entities/product_page_entity.dart';
import 'package:shopware_6/feature_products/domain/usecases/get_products_usecase.dart';

part 'products_event.dart';

part 'products_state.dart';

part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase _getProductsUsecase;

  ProductsBloc({
    required GetProductsUsecase getProductsUsecase,
  })  : _getProductsUsecase = getProductsUsecase,
        super(const ProductsState.initial()) {
    on<_GetProducts>(_getProducts);
  }

  Future<void> _getProducts(_GetProducts event, Emitter<ProductsState> emit) async {
    emit(const ProductsState.loading());

    try {
      final products = await _getProductsUsecase();
      emit(ProductsState.loaded(products: products));
    } on Exception catch (e) {
      emit(ProductsState.error('Error loading products: ${e.toString()}'));
    }
  }
}
