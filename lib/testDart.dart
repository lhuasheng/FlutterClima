import 'dart:io';
import 'package:clima/services/networking.dart';

const String appKey = '4400e8a1f800c71fc7d05c677b04d2f8';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

dynamic getCityWeather() async {
  String cityName = 'Singapore';
  NetworkHelper networkHelper = NetworkHelper(
      'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&appid=$appKey');
  var weatherData = await networkHelper.getData();
  print(weatherData[0]['lat']);
  return weatherData;
}

void main() {
  // performTasks();
  print(getCityWeather());
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// String task2() {
Future task2() async {
  Duration threeSec = Duration(seconds: 3);
  // sleep(threeSec);
  String result;
  Future f1 = Future.delayed(Duration(seconds: 8), () {
    result = 'task 2 data';
    print('Task 2a complete');
  });

  String result2;
  Future f2 = Future.delayed(threeSec, () {
    result2 = 'task 2 data';
    print('Task 2b complete');
  });

  await f1;
  await f2;

  return result;
}

void task3(String task2Result) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Result');
}
