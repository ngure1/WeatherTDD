import 'package:dotenv/dotenv.dart';

class Urls {
  static late final String baseUrl;
  static late final String apiKey;

  static void loadEnv() {
    final env = DotEnv(includePlatformEnvironment: true)..load();
    baseUrl = env['BASE_URL']!;
    apiKey = env['API_KEY']!;
  }

  static String getCurrentWeatherByCityName(String cityName) {
    return '$baseUrl/weather?q=$cityName&appid=$apiKey';
  }
}

