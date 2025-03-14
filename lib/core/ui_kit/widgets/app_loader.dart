import 'package:flutter/material.dart';
import 'package:shopware_6/core/ui_kit/theming/app_theme.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: appTheme.colorPalette.irisBlue,
      ),
    );
  }
}
