class City {
  String name;
  double lat;
  double lon;
  String country;


   City({ required this.name, required this.lat,required this.lon,required this.country});

  String getName() {return name;}
  double getLat() {return lat;}
  double getLon() {return lon;}
  String getCountry() {return country;}

  static City getDefaultCity() {
    return City(name: "Annecy", country: "FR", lat: 45.8992348, lon: 6.1288847) ;
  }


  @override
  String toString() {
    return "$name ( lat:$lat, long:$lon ) : $country" ;
  }

  factory City.fromJson(List<dynamic> json) {
    return City(
        name: json[0]['name'],
        lat: json[0]['lat'],
        lon: json[0]['lon'],
        country: json[0]['country']
    );
  }
}