import 'package:flutter/material.dart';
import 'package:climaapp/services/location.dart';
import 'package:climaapp/services/networking.dart';
const apiKey='5f86a07eb4c094962b75642f62896fa5';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude=0.0;
  double latitude=0.0;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    Location location=Location();
    await location.getCurrentLocation();
    longitude=location.longitude;
    latitude=location.latitude;
    NetworkHelper networkHelper=NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData=await networkHelper.getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
