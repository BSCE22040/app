import 'dart:convert';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future <Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/forecast?q=London&APPID=0c1d2be22f4120a9bd65565df110f4fa";

      final result = await http.get(
        Uri.parse(
          url,
        ),
      );
      final data = jsonDecode(result.body);
      if (data["cod"] != "200") {
        throw "An unexpected error occurred";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
  @override
  void initState() {
    super.initState();
    weather=getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather=getCurrentWeather();
                
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = (currentWeatherData['main']['temp']);
          final currentSky = (currentWeatherData['weather'][0]['main']);
          final pressure = currentWeatherData['main']['pressure'];
          final humidity = currentWeatherData['main']['humidity'];
          final windspeed = currentWeatherData['wind']['speed'];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "$currentTemp K",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Icon(
                                  currentSky == 'Clouds' || currentSky == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 60,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  currentSky,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hourly Weather Forecast",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(13, (i) {
                        final time =
                            DateTime.parse(data['list'][i + 1]['dt_txt']);
                        return HourlyForeCast(
                          time: DateFormat.j().format(time),
                          temperature:
                              data['list'][i + 1]['main']['temp'].toString(),
                          icon: data['list'][i + 1]['weather'][0]['main'] ==
                                      "Clouds" ||
                                  data['list'][i + 1]['weather'][0]['main'] ==
                                      "Rain"
                              ? Icons.cloud
                              : Icons.sunny,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AdditionalInfoItem(
                          icon: Icons.water_drop,
                          label: "Humidity",
                          value: humidity.toString(),
                        ),
                        const SizedBox(width: 80),
                        AdditionalInfoItem(
                          icon: Icons.air,
                          label: "Wind Speed",
                          value: windspeed.toString(),
                        ),
                        const SizedBox(width: 90),
                        AdditionalInfoItem(
                          icon: Icons.beach_access,
                          label: "Pressure",
                          value: pressure.toString(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
