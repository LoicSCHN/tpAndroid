import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'HomePage.dart';
import 'Model/City.dart';
import 'Model/ForecastList.dart';
import 'Model/Weather.dart';
import 'Utilities/Other.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<WeatherPage> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomepageCubit homepageCubit = context.read<HomepageCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(title: widget.title),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            _getCityName(homepageCubit),
            const SizedBox(height: 30),
            _cityTittle(homepageCubit.getCity()),
            const SizedBox(height: 10),
            const Text(
              "Météo du jour",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            _getCurrentWeather(homepageCubit.getCurrentWeather()),
            const SizedBox(height: 30),
            const Text(
              "Météo pour les 5 prochains jours",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            _getForecastWeather(homepageCubit.getForecast()),
          ],
        ),
      ),
    );
  }

  Container _getCityName(HomepageCubit homepageCubit) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        // Or set whatever you want
        child: Column(children: <Widget>[
          TextFormField(
            maxLength: 80,
            controller: searchController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelText: "Chercher une ville : ",
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.black,
                onPressed: () {
                  homepageCubit.searchCity(cityName: searchController.text);
                },
              ),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
          )
        ]));
  }

  Widget _cityTittle(City city) {
    String cdate1 = DateFormat("EEEEE dd MMMM yyyy").format(DateTime.now());
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: Colors.black, width: 0.1)),
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text("${city.name} (${city.country}) , ${cdate1}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _getCurrentWeather(Weather weather) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 0.1)),
      color: Colors.white,
      elevation: 8,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Column(
              children: [
                Other.getWeatherIcon(
                  description: weather.icon,
                  size: 32.0,
                ),
                const SizedBox(height: 2),
                Text(
                  weather.icon,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Température : ${weather.temp} °C"),
                const SizedBox(width: 30),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("(Ressenti: ${weather.feelsLike} °C)"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(weather.description),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Icon(FontAwesomeIcons.wind,
                        color: Colors.grey, size: 32.0),
                    Text(
                      "${weather.windSpeed} km/h",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const Icon(FontAwesomeIcons.water,
                        color: Colors.blue, size: 32.0),
                    Text(
                      "${weather.humidity} %",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const Icon(FontAwesomeIcons.fan,
                        color: Colors.blueGrey, size: 32.0),
                    Text(
                      "${weather.pressure} hpa",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _getForecastWeather(ForecastList fl) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        height: 250.0,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemCount: fl.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: 200.0,
                  padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        )
                      ]),
                  child: Column(children: [
                    Text(
                      "${fl.list[index].date} à 12H00",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    const SizedBox(height: 15),
                    Other.getWeatherIcon(
                        description: fl.list[index].icon, size: 28),
                    const SizedBox(height: 2),
                    Text(
                      fl.list[index].icon,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Min : ${fl.list[index].temp}°C",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(height: 10),
                    const Icon(FontAwesomeIcons.wind,
                        color: Colors.blueGrey, size: 24.0),
                    Text(
                      "${fl.list[index].windSpeed} km/h",
                      textAlign: TextAlign.center,
                    ),
                  ]));
            }));
  }

  AppBar _getAppBar({required String title}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
