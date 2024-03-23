import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue[500],
        ),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue[300] ?? Colors.blue,
                Colors.blue[800] ?? Colors.blue,
              ],
            )),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 10),
                  child: Column(
                    children: [
                      //Search
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            //Search Icon
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/loading",
                                    arguments: {
                                      "searchtext": search.text,
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            //Search Text
                            Expanded(
                              child: TextField(
                                controller: search,
                                decoration: const InputDecoration(
                                  hintText: "Search Your City",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Location
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      height: 70,
                                      child: Image.asset("assets/img/1.png")),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Scatterd Clouds In",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (info?["city_value"] ?? ""),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Temperature
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/2.png",
                                  height: 70,
                                ),
                                const Text(
                                  "Temperature",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (double.parse(info?["temp_data"] ?? "0"))
                                      .toStringAsFixed(1),
                                  style: const TextStyle(
                                      fontSize: 120,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  " c",
                                  style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      //Humidity and WindSpeed
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/img/3.png",
                                        height: 40,
                                      ),
                                      const Text(
                                        "Humidity",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                          (double.parse(
                                                  info?["hum_data"] ?? "0"))
                                              .toStringAsFixed(1),
                                          style: const TextStyle(
                                              fontSize: 70,
                                              fontWeight: FontWeight.bold)),
                                      const Text("Percent",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(width: 10),
                          Expanded(
                            child: Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/img/5.png",
                                        height: 40,
                                      ),
                                      const Text(
                                        "Wind Speed",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                          (double.parse(
                                                  info?["temp_data"] ?? "0"))
                                              .toStringAsFixed(1),
                                          style: const TextStyle(
                                              fontSize: 70,
                                              fontWeight: FontWeight.bold)),
                                      const Text("Km/hr",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Footer
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Made By Masum",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Data Provided By Open Weather Map",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
