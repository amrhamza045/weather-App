import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getForecast({required String cityName}) async {
    try {
      Response response = await dio
          .get('https://api.weatherapi.com/v1/forecast.json', queryParameters: {
        'key': '6151a5cfbf0d4244ba094814241609',
        'q': cityName,
        'days': 7,
      });
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      // ignore: avoid_print
      print(e.response?.data['error']['message'] ?? 'Unknown Error');
      throw (e.response?.data['error']['message'] ?? 'Unknown Error');
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      throw Exception('Unknown Error');
    }
  }

  //? temp data
  WeatherModel getcurrentWeather() {
    return WeatherModel(
      cityName: 'London',
      date: '2021-09-01',
      weatherCondition: 'Sunny',
      temperature: '20',
      maxTemp: '22',
      minTemp: '18',
      humidity: '50',
      windSpeed: '10',
      winddirection: 'NE',
      pressure: '1013',
      visibility: '10',
      feelsLike: '20',
      uvIndex: '1',
      hourlyForecast: [],
      fiveDayForecast: [],
    );
  }
  //? temp data
}
