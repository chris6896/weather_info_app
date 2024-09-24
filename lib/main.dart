import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "City Name";
  String _temperature = "Temperature";
  String _weatherCondition = "Weather Condition";

  void _fetchWeather() {
    setState((){
      _cityName = _cityController.text.isNotEmpty
        ? _cityController.text
        : "Unknown City";
     
      final random = Random();
      int temp = 15 + random.nextInt(16);
      _temperature = "$temp C";

      List<String> conditions = ['Sunny','Rainy','Cloudy'];
      _weatherCondition = conditions[random.nextInt(3)]; 
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Weather"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter City Name",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
               child: const Text("Fetch Weather"),
            ),
            const SizedBox(height: 20),
            Text(
              'City: $_cityName',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              _temperature,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              _weatherCondition,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}