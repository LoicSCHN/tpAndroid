import 'package:flutter/cupertino.dart';
import 'package:meteo/Utilities/Network.dart';
import 'dart:ui';
import 'Model/City.dart';
import 'Model/ForecastList.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'Model/Weather.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {
  City city;
  Weather w;


  HomepageInitial({required this.city, required this.w});
}

class HomepageCubit extends Cubit<HomepageState> {
  City c;
  Weather w;
  ForecastList forecast = ForecastList();

  HomepageCubit({required this.c, required this.w}) : super(HomepageInitial(city: c, w: w)) {
    searchCity(cityName: "Annecy") ;
  }

  void searchCity({required String cityName}) async {
    Future<City> futureV = Network.getCity(cityName: cityName) ;
    c =  (await futureV) ;

    Future<Weather> futureW = Network.getCurrentWeather(city: c) ;
    w =  (await futureW) ;

    Future<ForecastList> futureFw = Network.getForecastWeather(city: c) ;
    forecast =  (await futureFw);

    emit(HomepageInitial(city: c, w: w)) ;
  }

  City getCity() { return c ; }
  Weather getCurrentWeather() { return w;   }
  ForecastList getForecast() { return forecast;   }
}