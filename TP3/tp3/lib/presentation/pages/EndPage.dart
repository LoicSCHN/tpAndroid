import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EndPage extends StatefulWidget {
  const EndPage({super.key});

  //const EndPage(BuildContext context);

  @override
  State<StatefulWidget> createState() => EndPageState();
}

class EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    int score = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: _getAppBar(),
        body: Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.topCenter,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                const SizedBox(height: 50),
                Text(
                  "Félicitation, votre score est de : $score",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ]),
              Row(children: <Widget>[
                TextButton(
                  style: _getBtnStyle(),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(
                        context,
                        "/",
                      );
                    });
                  },
                  child: const Text("Menu",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )
              ])
            ])));
  }

  ButtonStyle _getBtnStyle({Color color = Colors.blueGrey}) {
    return ElevatedButton.styleFrom(
      primary: color,
      onPrimary: Colors.white,
      shadowColor: Colors.blueGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      minimumSize: const Size(100, 75),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text("Score"),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}
