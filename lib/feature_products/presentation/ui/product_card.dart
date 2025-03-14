import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shopware_6/core/ui_kit/theming/app_theme.dart';
import 'package:shopware_6/core/ui_kit/widgets/app_button.dart';
import 'package:shopware_6/feature_products/domain/entities/product_page_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = appTheme.colorPalette;
    final typography = appTheme.typography;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: 200,
            child: ProductVideoWebView(videoUrl: product.imageUrl),
          ),
          const SizedBox(height: 24),
          Text(product.name, style: typography.subtitleBold),
          const SizedBox(height: 16),
          Text(product.description, style: typography.bodyMedium),
          const SizedBox(height: 24),
          Text('€ ${product.price}', style: typography.subtitleBold),
          const SizedBox(height: 24),
          const AppButton(
            title: 'Add to cart',
          ),
        ],
      ),
    );
  }
}

class ProductVideoWebView extends StatefulWidget {
  final String videoUrl;

  const ProductVideoWebView({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _ProductVideoWebViewState createState() => _ProductVideoWebViewState();
}

class _ProductVideoWebViewState extends State<ProductVideoWebView> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(widget.videoUrl))),
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          mediaPlaybackRequiresUserGesture: false,
          mediaType: 'webm',
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
      ),
    );
  }
}
