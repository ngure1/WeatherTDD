import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/core/constants/constants.dart';
import 'package:weather_tdd/core/error/exception.dart';
import 'package:weather_tdd/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_tdd/data/models/weather_model.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  const String testCityName = "London";

  setUpAll(() {
    Urls.loadEnv();
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  group('getCurrentWeatherByCityName', () {
    final WeatherModel testWeatherModel = WeatherModel.fromJson(
      jsonDecode(readJson('helpers/dummyData/dummy_weather_response.json')),
    );

    test('should return weather model on status code 200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse(Urls.getCurrentWeatherByCityName(testCityName))))
          .thenAnswer((_) async {
        return http.Response(
            readJson('helpers/dummyData/dummy_weather_response.json'), 200);
      });

      // act
      final result = await weatherRemoteDataSourceImpl
          .getCurrentWeatherByCityName(testCityName);

      //assert
      expect(result, equals(testWeatherModel));
    });

    test('should throw a server exception on status code !200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse(Urls.getCurrentWeatherByCityName(testCityName))))
          .thenAnswer((_) async {
        return http.Response('Something went wrong', 400);
      });

      // act & assert
      expect(
          () => weatherRemoteDataSourceImpl
              .getCurrentWeatherByCityName(testCityName),
          throwsA(isA<ServerExeption>()));
    });
  });
}
