import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:weather_tdd/core/error/exception.dart';
import 'package:weather_tdd/core/error/failure.dart';
import 'package:weather_tdd/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';
import 'package:weather_tdd/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this.remoteDataSource);
  late final WeatherRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByCityName(
      String cityName) async {
    try {
      final result =
          await remoteDataSource.getCurrentWeatherByCityName(cityName);
      return Right(result.toEntity());
    } on ServerExeption {
      return const Left(ServerFailure("an error has occured"));
    } on SocketException {
      return const Left(ConnectionFailure("no internet connection"));
    }
  }
}
