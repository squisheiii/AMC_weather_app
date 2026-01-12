import 'package:flutter/material.dart';
import 'screens/weather_screen.dart'; // Siguraduhin na tama ang path na ito

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tinatanggal ang 'debug' banner
      title: 'Manila Weather App',
      theme: ThemeData(
        useMaterial3: true,
        // Binago ang seedColor sa Yellow/Amber para sa "Sunny" vibe
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
        ),
        // Opsyonal: Nagdagdag ng Scaffold background color para mas luminaw
        scaffoldBackgroundColor: const Color(0xFFFFFDE7), // Light yellow background
      ),
      // Dito natin tinatawag ang iyong WeatherScreen
      home: const WeatherScreen(),
    );
  }
}
