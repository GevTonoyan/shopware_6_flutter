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
            //child: ProductVideoWebView(videoUrl: product.imageUrl),
            child: VideoWebView(videoUrl: product.imageUrl),
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

class VideoWebView extends StatefulWidget {
  final String videoUrl;

  const VideoWebView({super.key, required this.videoUrl});

  @override
  State<VideoWebView> createState() => _VideoWebViewState();
}

class _VideoWebViewState extends State<VideoWebView> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    String htmlContent = """
    <!DOCTYPE html>
    <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
        body { margin: 0; padding: 0; overflow: hidden; background: black; }
        video {
          width: 100vw; height: 100vh;
          object-fit: cover;
          pointer-events: none; /* Disable any touch interactions */
        }
      </style>
    </head>
    <body>
      <video id="video" autoplay loop muted playsinline>
        <source src="${widget.videoUrl}" type="video/webm">
        Your browser does not support the video tag.
      </video>
      <script>
        document.addEventListener("DOMContentLoaded", function() {
          var video = document.getElementById("video");
          video.removeAttribute("controls"); // Ensure controls are hidden
          video.play();
        });
      </script>
    </body>
    </html>
    """;

    return Scaffold(
      body: InAppWebView(
        initialData: InAppWebViewInitialData(data: htmlContent),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
      ),
    );
  }
}
