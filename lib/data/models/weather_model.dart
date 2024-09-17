import 'package:equatable/equatable.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';

class WeatherModel extends Equatable {
  const WeatherModel(
      {required this.cityName,
      required this.main,
      required this.description,
      required this.iconCode,
      required this.temperature,
      required this.pressure,
      required this.humidity});

  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final int pressure;
  final int humidity;

  @override
  List<Object?> get props =>
      [cityName, main, description, iconCode, temperature, pressure, humidity];

  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: cityName,
      main: main,
      description: description,
      iconCode: iconCode,
      temperature: temperature,
      pressure: pressure,
      humidity: humidity,
    );
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["name"],
      main: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      iconCode: json["weather"][0]["icon"],
      temperature: json["main"]["temp"],
      pressure: json["main"]["pressure"],
      humidity: json["main"]["humidity"],
    );
  }

  Map<String,dynamic> toJson(WeatherModel weatherModel) {
    return {
      "name": weatherModel.cityName,
      "weather": [
        {
          "main": weatherModel.main,
          "description": weatherModel.description,
          "icon": weatherModel.iconCode
        }
      ],
      "main": {
        "temp": weatherModel.temperature,
        "pressure": weatherModel.pressure,
        "humidity": weatherModel.humidity
      }
    };
  }
}
