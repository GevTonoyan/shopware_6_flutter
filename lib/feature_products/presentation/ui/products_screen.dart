import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopware_6/core/ui_kit/widgets/app_loader.dart';
import 'package:shopware_6/feature_products/presentation/bloc/products_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            // one button to fetch the products
            return Column(
              children: [
                const SizedBox(height: 200),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductsBloc>().add(
                          const ProductsEvent.getProducts(),
                        );
                  },
                  child: const Text('Fetch Products'),
                ),
                // show the products
                const SizedBox(height: 12),
                state.maybeWhen(
                  loading: () {
                    return const AppLoader();
                  },
                  loaded: (products) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(products[index]),
                          );
                        },
                      ),
                    );
                  },
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
