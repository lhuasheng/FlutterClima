import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String appKey = '4400e8a1f800c71fc7d05c677b04d2f8';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(cityName) async {
    // String cityName = 'Singapore';
    NetworkHelper networkHelperLoc = NetworkHelper(
        'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&appid=$appKey');
    var locData = await networkHelperLoc.getData();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${locData[0]['lat']}&lon=${locData[0]['lon'].toString()}&appid=$appKey&units=metric');

    var weatherData = await networkHelper.getData();
    print('weather data$weatherData');
    return weatherData;

    print(weatherData[0]['lat']);
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    // longitude = location.longitude;
    // latitude = location.latitude;
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$appKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
