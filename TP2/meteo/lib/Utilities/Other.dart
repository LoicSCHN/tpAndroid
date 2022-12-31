import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Other {

  static String myApiKey() { return "a404449a5685a67dec1fc1ce26955705" ;   }

  static Widget getWeatherIcon({required String description, required double size}) {
    switch(description) {
      case "Clear":
        { return Icon(FontAwesomeIcons.sun, color: Colors.yellow, size: size) ; }
        break;
      case "Clouds":
        { return Icon(FontAwesomeIcons.cloud, color: Colors.grey, size: size) ; }
        break;
      case "Rain":
        { return Icon(FontAwesomeIcons.cloudRain, color: Colors.grey, size: size) ; }
        break;
      case "Snow":
        { return Icon(FontAwesomeIcons.snowman, color: Colors.blue[100], size: size) ; }
        break;
      default:
        { return Icon(FontAwesomeIcons.sun, color: Colors.yellow, size: size) ; }
        break;
    }

  }

}

