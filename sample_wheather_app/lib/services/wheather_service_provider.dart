import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sample_wheather_app/models/wheather_response_model.dart';
import 'package:sample_wheather_app/secrets/api.dart';

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;

  WeatherModel? get weather => _weather;

  bool _isloading = false;
  bool get isLoading => _isloading;

  String _error = "";
  String get error => _error;

  Future<void> fetchWeatherDataByCity(String city) async {
    _isloading = true;
    _error = "";
    // https: api.openweathermap.org/data/2.5/weather?q=dubai&appid=ad93ec9d6bcf5c35eec3b3f597b82047&units=metric
    try {
      final String apiUrl =
          "${APIEndPoints().cityUrl}${city}&appid=${APIEndPoints().apikey}${APIEndPoints().unit}";
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        _weather = WeatherModel.fromJson(data);
        print(_weather!.main!.feelsLike);

        notifyListeners();
      } else {
        _error = "Failed to load data";
      }
    } catch (e) {
      _error = "Failed to load data $e";
    } finally {
      _isloading = false;

    }
  }
}