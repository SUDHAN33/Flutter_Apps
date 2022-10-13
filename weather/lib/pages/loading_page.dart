import 'package:weather/pages/location_page.dart';
import 'package:weather/contents/networking.dart';
import 'package:flutter/material.dart';
import 'package:weather/contents/place.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/contents/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
     var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
      LocationScreen(
         weatherData,
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.blueGrey,
          size: 100.0,
        ),
      ),
    );
  }
}
