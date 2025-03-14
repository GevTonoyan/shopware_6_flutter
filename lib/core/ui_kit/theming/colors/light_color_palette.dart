import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/ui_kit/theming/colors/base_color_palette.dart';

class LightColorPalette implements BaseColorPalette {
  @override
  Color get whiteSmoke => const Color(0xFFF8F8F8);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get irisBlue => const Color(0xFF11B0C8);

  @override
  Color get nero => const Color(0xFF1F1F1F);

  @override
  Color get grey => const Color(0xFF808080);
}
