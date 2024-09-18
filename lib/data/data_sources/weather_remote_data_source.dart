import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_tdd/core/constants/constants.dart';
import 'package:weather_tdd/core/error/exception.dart';
import 'package:weather_tdd/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherByCityName(String cityName);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required this.httpClient});

  final http.Client httpClient;

  @override
  Future<WeatherModel> getCurrentWeatherByCityName(String cityName) async {
    final response = await httpClient.get(Uri.parse(Urls.getCurrentWeatherByCityName(cityName)));
    if(response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    }else{
      throw ServerExeption();
    }
  }
}
