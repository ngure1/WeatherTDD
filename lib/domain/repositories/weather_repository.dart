

import 'package:dartz/dartz.dart';
import 'package:weather_tdd/core/error/failure.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';

abstract class WeatherRepository {

  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByCityName(String cityName);
}