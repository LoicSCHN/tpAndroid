// importation du paquetage pour utiliser Material Design
import 'package:flutter/material.dart';
void main() => runApp(MyApp()); // point d'entrée
// Le widget racine de notre application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // une application utilisant Material Design
      title: 'My First Flutter App',
      theme: ThemeData(), // données relatives au thème choisi
      home: const ProfileHomePage(), // le widget de la page d'accueil

    );
  }
}

// Le widget de notre page d'accueil
class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Home Page"),
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              _getCard(),
              Positioned(
                top: -50,
                child: _getAvatar(),
              )
            ]
        ),

      ),
    );
  }
  Container _getCard() {
    return  Container(
      width: 280.0,
      height: 260.0,
      padding: const EdgeInsets.only(left: 0.0, top: 100, right: 0.0, bottom: 0.0),
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),

      ),
      child: Column(
        children: const[
          Text("Loïc SCHNURIGER", style: TextStyle(color: Colors.white),),
          Text("loic.sch@gmail.com", style: TextStyle(color: Colors.white),),
          Text("Insta : grosBGdu34", style: TextStyle(color: Colors.white),)
        ],
      )
  );
  }
  Container _getAvatar() {
    return  Container(
      alignment: Alignment.topCenter,
      width: 120.0,
      height: 120.0,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pinkAccent, width: 2.0, style: BorderStyle.solid, strokeAlign: StrokeAlign.outside),
          image: const DecorationImage(
              image: AssetImage("asset/moi.jpg"),
              fit: BoxFit.cover
          )
      )
  );
  }
}

