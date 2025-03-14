import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopware_6/core/ui_kit/widgets/app_loader.dart';
import 'package:shopware_6/feature_products/presentation/bloc/products_bloc.dart';
import 'package:shopware_6/feature_products/presentation/ui/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(const ProductsEvent.getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const AppLoader();
              },
              error: (message) {
                return Center(child: Text(message));
              },
              loaded: (products) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView.separated(
                    itemCount: products.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 24);
                    },
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                );
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
