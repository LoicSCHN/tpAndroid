import 'dart:convert';

import 'package:meteo/Model/City.dart';
import 'package:meteo/Model/Weather.dart';
import 'package:meteo/Utilities/Other.dart';
import 'package:http/http.dart' as http;

import '../Model/ForecastList.dart';

class Network{

  static Future<City> getCity({required String cityName}) async {
    var finalUrl = "http://api.openweathermap.org/geo/1.0/direct?q=$cityName&appid=${Other.myApiKey()}";
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      return City.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot get $cityName coordinates");
    }
  }
  static Future<Weather> getCurrentWeather({required City city}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?lat=${city.getLat()}&lon=${city.getLon()}&units=metric&appid=${Other.myApiKey()}";
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      // print("data: ${response.body}}") ;
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot get ${city.name} weather");
    }
  }
  static Future<ForecastList> getForecastWeather({required City city}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=${city.getName()}&cnt=100&units=metric&appid=${Other.myApiKey()}";
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      // print("data: ${response.body}}") ;
      return ForecastList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot get ${city.name} forecast weather");
    }
  }
}




