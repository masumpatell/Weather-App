import 'dart:convert';

import 'package:http/http.dart';

//class
class Management {
  // Instance Variable
  late String location;
  late String temp = "";
  late String humidity = "";
  late String airspeed = "";
  late String description = "";
  late String main;

  Management({required this.location}) //Constructor
  {
    location = this.location;
  }

  //Method
  Future<void> get_data() async {
    try {
      Response r = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ce02ccaa8622887ecacdb5ed7cffc4b2"));
      Map<String, dynamic> data = jsonDecode(r.body);

      String getLocation = data["name"];

      var getMain = data["main"];
      double getTemp = getMain["temp"] - 273.15;
      String getHumidity = getMain["humidity"].toString();

      var wind = data["wind"];
      double getAirspeed = wind["speed"] / 0.27777777777778;

      var weather = data["weather"];
      String getDescription = weather[0]["description"];
      String getMainDescription = weather[0]["main"];

      main = getMainDescription;
      location = getLocation;
      temp = getTemp.toString();             //C
      humidity = getHumidity;                //%
      airspeed = getAirspeed.toString();     //Km/hr
      description = getDescription;
    } catch (e) {
      // e stand for error return error argument
      print("wrong value insert please insert write value");
    }
  }
}
