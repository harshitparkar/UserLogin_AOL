import 'package:flutter/material.dart';


class SpacerWidget extends StatefulWidget {
  State<SpacerWidget> createState() {
    return SpacerWidgetState();
  }
}

class SpacerWidgetState extends State<SpacerWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SpacerWidget",
        ),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.greenAccent,
              child: Row(
                children: [
                  Container(
                    child: Text("Test"),
                  ),
                  Spacer(
                    flex: 7,
                  ),
                  Container(child: Text("Test2"),),
                  Spacer(flex: 1),
                  Container(child: Text("Test3"),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
