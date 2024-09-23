import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/core/error/exception.dart';
import 'package:weather_tdd/core/error/failure.dart';
import 'package:weather_tdd/data/models/weather_model.dart';
import 'package:weather_tdd/data/repositories/weather_repository_impl.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WeatherRepositoryImpl weatherRepositoryImpl;
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(mockWeatherRemoteDataSource);
  });

  const String testCityName = "London";
  const testWeatherEntity = WeatherEntity(
    cityName: testCityName,
    main: "Clouds",
    description: "broken clouds",
    iconCode: "04n",
    temperature: 290.67,
    pressure: 1030,
    humidity: 72,
  );

  const testWeatherModel = WeatherModel(
    cityName: testCityName,
    main: "Clouds",
    description: "broken clouds",
    iconCode: "04n",
    temperature: 290.67,
    pressure: 1030,
    humidity: 72,
  );

  group('getCurrentWeatherByCityName', () {
    test(
        'returns a weather entity when the call to remote data source is successful',
        () async {
      // arange
      when(mockWeatherRemoteDataSource
              .getCurrentWeatherByCityName(testCityName))
          .thenAnswer((_) async => testWeatherModel);

      // act
      final result =
          await weatherRepositoryImpl.getCurrentWeatherByCityName(testCityName);
      // assert
      expect(result, equals(const Right(testWeatherEntity)));
    });

    test(
        'returns a server failure when the call to remote data source is unsuccessful',
        () async {
      // arange
      when(mockWeatherRemoteDataSource
              .getCurrentWeatherByCityName(testCityName))
          .thenThrow(ServerExeption());

      // act
      final result =
          await weatherRepositoryImpl.getCurrentWeatherByCityName(testCityName);
      // assert
      expect(result, equals(const Left(ServerFailure("an error has occured"))));
    });

    test(
        'returns a connection failure when the device is not connected to internet',
        () async {
      // arange
      when(mockWeatherRemoteDataSource
              .getCurrentWeatherByCityName(testCityName))
          .thenThrow(const SocketException("no internet connection"));

      // act
      final result =
          await weatherRepositoryImpl.getCurrentWeatherByCityName(testCityName);
      // assert
      expect(result,
          equals(const Left(ConnectionFailure("no internet connection"))));
    });
  });
}
