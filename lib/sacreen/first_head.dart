import 'dart:convert';
import 'dart:ui';

import 'package:fire_flutter/admin/Login.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fire_flutter/model/weathermod.dart';
import 'package:fire_flutter/sacreen/hourebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage(String? email, {super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'mohali';
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&APPID=32eaca329590d8262fac84eb5de5a30f',
        ),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw "An unexpected error occurred";
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(65, 100, 220, 0.984),
        title: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Weather App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    }).onError((error, stackTrace) {
                      print(stackTrace);
                    });
                  },
                  child: SizedBox(
                    child: Text(
                      "${FirebaseAuth.instance.currentUser!.email}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final data = snapshot.data!;
            final currentWeatherData = data['list'][0];
            final currentTemp = (currentWeatherData['main']['temp'] - 273.15)
                .toStringAsFixed(1);
            final currentSky = currentWeatherData['weather'][0]['main'];
            final icondata = currentWeatherData['weather'][0]['icon'];
            final currentPressure = currentWeatherData['main']['pressure'];
            final currentWindSpeed = currentWeatherData['wind']['speed'];
            final currentHumidity = currentWeatherData['main']['humidity'];
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(65, 100, 220, 0.984),
                      Color(0xff68A5EA)
                    ]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    //-----------------main card----------------
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .26,
                      child: Card(
                        elevation: 6,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(65, 100, 220, 0.984),
                                  Color(0xff68A5EA)
                                ]),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '$currentTemp°C',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.network(
                                      "https://openweathermap.org/img/wn/${icondata}.png",
                                      scale: .9,
                                    ),
                                    // Icon(
                                    //   currentSky == "Clouds" ||
                                    //           currentSky == "Rain"
                                    //       ? Icons.cloud
                                    //       : Icons.sunny,
                                    //   size: 64,
                                    //   color: currentSky == "Clouds" ||
                                    //           currentSky == "Rain"
                                    //       ? Color.fromARGB(255, 134, 134, 134)
                                    //       : Color.fromARGB(255, 58, 57, 57),
                                    // ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      currentSky,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 1.4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hourly Forecast",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          final hourlyForecast = data['list'][index + 1];
                          final hourlyForecastTemp =
                              (hourlyForecast['main']['temp'] - 273.15)
                                  .toStringAsFixed(1);
                          final icondata0 =
                              data['list'][index + 1]['weather'][0]['icon'];
                          final time = DateTime.parse(hourlyForecast['dt_txt']);
                          return HourlyForecastItem(
                            time: DateFormat('j').format(time),
                            temp: '$hourlyForecastTemp°C',
                            icon:
                                "https://openweathermap.org/img/wn/${icondata0}.png",
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Additional Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      elevation: 6,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromRGBO(65, 100, 220, 0.984),
                                    Color(0xff68A5EA)
                                  ]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AdditionalItems(
                                    icon: Icons.water_drop,
                                    label: "Humidity",
                                    value: currentHumidity.toString(),
                                  ),
                                  AdditionalItems(
                                    icon: Icons.air,
                                    label: "Wind Speed",
                                    value: currentWindSpeed.toString(),
                                  ),
                                  AdditionalItems(
                                    icon: Icons.beach_access,
                                    label: "Pressure",
                                    value: currentPressure.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
