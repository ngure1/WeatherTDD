import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/domain/entities/weather_entity.dart';
import 'package:weather_tdd/domain/usecases/get_current_weather_by_city_name_usecase.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherByCityNameUsecase getCurrentWeatherByCityNameUsecase;
  late MockWeatherRepository mockWeatherRepository;
  
  mockWeatherRepository = MockWeatherRepository();
  getCurrentWeatherByCityNameUsecase =
      GetCurrentWeatherByCityNameUsecase(repository: mockWeatherRepository);

  const String testCityName = "London";
  const testWeatherDetail = WeatherEntity(
    cityName: testCityName,
    main: "Clouds",
    description: "few clouds",
    iconCode: "02d",
    temperature: 10.0,
    pressure: 1010,
    humidity: 50,
  );

  test('should get current weather by city name from the repository', () async {
    // arrange
    when(mockWeatherRepository.getCurrentWeatherByCityName(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));
    // act
    final result =
        await getCurrentWeatherByCityNameUsecase.execute(testCityName);
    // assert
    expect(result, const Right(testWeatherDetail));
  });
}
