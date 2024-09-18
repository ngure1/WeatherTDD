import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tdd/data/models/weather_model.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
    cityName: "London",
    main: "Clouds",
    description: "broken clouds",
    iconCode: "04n",
    temperature: 290.67,
    pressure: 1030,
    humidity: 72,
  );

  const testWeatherEntity = WeatherEntity(
    cityName: "London",
    main: "Clouds",
    description: "broken clouds",
    iconCode: "04n",
    temperature: 290.67,
    pressure: 1030,
    humidity: 72,
  );

  test('should be equal to an entity', () async {
    // act
    final result = testWeatherModel.toEntity();
    // assert
    expect(result, equals(testWeatherEntity));
  });

  test('should return a valid model from json', () async {
    // arrange
    final weatherResponse =
        jsonDecode(readJson('helpers/dummyData/dummy_weather_response.json'));
    //act
    final result = WeatherModel.fromJson(weatherResponse);

    // assert
    expect(result, equals(testWeatherModel));
  });

  test('should return a valid json form model', () async {
    //arrange
    const expectedJsonMap = {
      "name": "London",
      "weather": [
        {"main": "Clouds", "description": "broken clouds", "icon": "04n"}
      ],
      "main": {"temp": 290.67, "pressure": 1030, "humidity": 72},
    };
    //act
    final result = testWeatherModel.toJson(testWeatherModel);
    //assert
    expect(result, equals(expectedJsonMap));
  });
}
