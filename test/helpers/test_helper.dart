import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_tdd/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_tdd/domain/repositories/weather_repository.dart';

@GenerateMocks([
  WeatherRepository,
  WeatherRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
