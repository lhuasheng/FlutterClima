import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    print('called');

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );

    // return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
// Center(
// child: ElevatedButton(
// onPressed: () {
// getLocationData();
// // getData();
// //Get the current location
// },
// child: Text('Get Location'),
// ),
// )
// void getData() async {
//   var longitude = jsonDecode(data)['coord']['lon'];
//   var weatherDescription = jsonDecode(data)['weather'][0]['description'];
//   double temperature = jsonDecode(data)['main']['temp'];
//   int conditionNum = jsonDecode(data)['weather'][0]['id'];
//   String cityName = jsonDecode(data)['name'];
//
//   print('$weatherDescription $temperature $conditionNum $cityName');
//   print(longitude);
// }
