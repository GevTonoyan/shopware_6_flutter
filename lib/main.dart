import 'package:flutter/material.dart';
import 'package:shopware_6/core/dependency_injection/dependency_injection.dart';
import 'package:shopware_6/core/routing/router.dart';
import 'package:shopware_6/core/ui_kit/theming/app_theme.dart';
import 'package:shopware_6/core/ui_kit/theming/colors/light_color_palette.dart';

void main() async {
  await _preRunSetup();
  runApp(const MyApp());
}

Future<void> _preRunSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  // TODO need to be inside Inherited Widget
  appTheme.setColorPalette(LightColorPalette());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Shopware 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: appTheme.colorPalette.whiteSmoke,
        fontFamily: 'Lato',
        useMaterial3: true,
      ),
    );
  }
}
