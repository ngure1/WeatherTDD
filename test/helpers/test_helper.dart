import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_tdd/domain/repositories/weather_repository.dart';

@GenerateMocks([
  WeatherRepository,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
