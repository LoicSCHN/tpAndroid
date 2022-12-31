import 'package:intl/intl.dart';

import 'WeatherForecastModel.dart';


class ForecastList {

  List<WeatherForecastModel> list = [] ;
  ForecastList();

  List<WeatherForecastModel> getForecastList() {return list;}

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    ForecastList list = ForecastList() ;
    int count = json['cnt'] ; // nombre de prévisions
    String today = DateFormat("yyyy-MM-dd").format(DateTime.now());
    for (int i=0; i<count; i++) { // on parcourt toutes les prévisions
      WeatherForecastModel parsedForecast = WeatherForecastModel.fromJson(json['list'][i]) ;
      if (parsedForecast.date.split(" ")[0] != today) {
        String hour = parsedForecast.date.split(" ")[1];
        if (hour == "12:00:00") { // on prend que les prévisions pour 12H00
          parsedForecast.date = parsedForecast.date.split(" ")[0];
          list.getForecastList().add(parsedForecast);
        }
      }
    }
    return list;
  }
}