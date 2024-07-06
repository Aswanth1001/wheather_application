import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_wheather_app/screens/home_page.dart';
import 'package:sample_wheather_app/services/location_provider.dart';
import 'package:sample_wheather_app/services/wheather_service_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => WeatherServiceProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
            iconTheme: IconThemeData(color: Colors.white),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
