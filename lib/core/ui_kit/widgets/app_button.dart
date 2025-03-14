import 'package:flutter/material.dart';
import 'package:shopware_6/core/ui_kit/theming/app_theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: appTheme.colorPalette.irisBlue,
        ),
        child: Center(
          child: Text(
            title,
            style: appTheme.typography.bodyMedium.copyWith(
              color: appTheme.colorPalette.white,
            ),
          ),
        ),
      ),
    );
  }
}
