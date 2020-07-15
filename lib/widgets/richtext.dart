import 'package:flutter/material.dart';

class RichWidget extends StatefulWidget {
  State<RichWidget> createState() {
    return RichWidgetState();
  }
}

class RichWidgetState extends State<RichWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "RichWidget",
        ),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "  Test",
                style: TextStyle(fontSize: 40, color: Colors.orange),
                children: <TextSpan>[
                  TextSpan(
                      text: "  Test",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: "  Test",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.green,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
