import 'package:waterconservation/welcomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  MyApp myApp = new MyApp();
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}


/// Go to Android -> gradlew   (  |>|  ) with this logo --> RUN it as terminal
/// Run this code in terminal ---> gradlew signingReport
/// Make sure you have implemented all dependencies and packages in the yml and main also check the json file from google firebase.
/// First Implement all the layouts later run for SHA number i find this easy.
