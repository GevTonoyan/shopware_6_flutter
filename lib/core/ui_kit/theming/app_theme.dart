import 'package:shopware_6/core/ui_kit/theming/colors/base_color_palette.dart';
import 'package:shopware_6/core/ui_kit/theming/typography/app_typography.dart';

final appTheme = AppTheme();

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();

  BaseColorPalette? _colorPalette;
  final AppTypography typography = AppTypography();

  AppTheme._internal();

  // Singleton accessor
  factory AppTheme() {
    return _instance;
  }

  BaseColorPalette get colorPalette => _colorPalette!;

  void setColorPalette(BaseColorPalette colorPalette) {
    _colorPalette = colorPalette;
  }
}
