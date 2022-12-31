class Weather{
  String icon;
  String description;
  dynamic temp;
  dynamic min;
  dynamic max;
  dynamic feelsLike;
  dynamic humidity;
  dynamic windSpeed;
  dynamic pressure;

  static Weather getDefaultWeather() {
    return Weather(icon: "Clear", description: "only sun today :)", temp: 25,min: 20,max: 30,
        feelsLike: 24, humidity: 60.3, windSpeed: 3.1, pressure: 70.8) ;
  }

  Weather({required this.icon, required this.description, required this.temp,required this.min,required this.max, required this.feelsLike, required this.humidity,
    required this.windSpeed, required this.pressure});

  String getIcon() {return icon;}
  String getDescription() {return description;}
  double getTemp() {return temp;}
  double getMin() {return min;}
  double getMax() {return max;}
  double getFeelsLike() {return feelsLike;}
  double getHumidity() {return humidity;}
  double getWindSpeed() {return windSpeed;}
  double getPressure() {return pressure;}


  factory Weather.fromJson(Map<String, dynamic> json) {
    // print(json);
    return Weather(
        icon: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        min: json['main']['temp_min'],
        max: json['main']['temp_max'],
        feelsLike: json['main']['feels_like'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        pressure: json['main']['pressure']) ;
  }

}