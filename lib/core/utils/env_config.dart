import 'dart:convert';

import 'package:flutter/services.dart';

class EnvConfig {
  static late final String baseUrl;
  static late final String apiKey;

  static Future<void> load() async {
    final String data = await rootBundle.loadString('assets/env.json');
    final Map<String, dynamic> jsonMap = json.decode(data);

    baseUrl = jsonMap['BASE_URL'] ?? '';
    apiKey = jsonMap['API_KEY'] ?? '';
  }
}
