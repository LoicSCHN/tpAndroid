class WeatherForecastModel{
  String icon;
  String description;
  dynamic min;
  dynamic max;
  dynamic temp;
  dynamic windSpeed;
  String date;


  WeatherForecastModel({required this.icon, required this.description,required this.min,
    required this.max,required this.temp, required this.windSpeed,required this.date});

  String getIcon() {return icon;}
  String getDescription() {return description;}
  double getMin() {return min;}
  double getMax() {return max;}
  String getTemp() {return temp;}
  double getWindSpeed() {return windSpeed;}
  String getDate() {return date;}


  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    // print(json);
    return WeatherForecastModel(
        icon: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        min: json['main']['temp_min'],
        max: json['main']['temp_max'],
        temp: json['main']['temp'],
        windSpeed: json['wind']['speed'],
        date: json['dt_txt']);
  }

}