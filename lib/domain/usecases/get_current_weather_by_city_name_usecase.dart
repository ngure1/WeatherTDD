import 'package:dartz/dartz.dart';
import 'package:weather_tdd/core/error/failure.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';
import 'package:weather_tdd/domain/repositories/weather_repository.dart';

class GetCurrentWeatherByCityNameUsecase {

  final WeatherRepository repository;

  GetCurrentWeatherByCityNameUsecase({required this.repository});

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return repository.getCurrentWeatherByCityName(cityName);
  }
}