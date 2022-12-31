import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3/Data/Models/Question.dart';
import 'package:tp3/Data/Repositories/QuestionAll.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddPage> createState() => AddPageState();
}

class AddPageState extends State<AddPage> {

  final TextEditingController inputTextController = TextEditingController();
  final TextEditingController inputThemeController = TextEditingController();
  final TextEditingController inputImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: _getAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const Text(
              "Ajouter une question : ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            _getForm(),
          ],
        ),
      ),
    );
  }

  Container _getForm() {
    return Container(
        margin: const EdgeInsets.only(
            left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          TextFormField(
            controller: inputTextController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: "Texte",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: inputThemeController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: "Theme",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: inputImageController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: "Image",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30.0, top: 10.0),
                      child: TextButton(
                        style: _getBtnStyle(),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(
                              context,
                              "/",
                            );
                          });
                        },
                        child: const Text("Ajouter",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ))),
            ],
          ),
        ]));
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
      title: const Text("Menu"),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}
