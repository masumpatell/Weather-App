import 'package:flutter/material.dart';
import 'package:weatherapp/database/management.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

    var temp;
    var air;
    var main;
    var hum;
    var disc;
    var city="ahmedabad";

  void start(String city) async {
    Management z = Management(location: city);
    await z.get_data();
     temp = z.temp;
     air = z.airspeed;
     main = z.main;
     hum = z.humidity;
     disc = z.description;
     city = z.location;

    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_data": temp,
        "air_data": air,
        "main_data": main,
        "hum_data": hum,
        "disc_data": disc,
        "city_value": city,
      });
    });

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? search =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if(search?.isNotEmpty ?? false){
      city = search?["searchtext"] ?? "Default City";
    }

    start(city);

    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/4.png",
                height: 150,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Weather  App",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Made By Masum",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 60,
              ),
            ],
          ),
        ));
  }
}
