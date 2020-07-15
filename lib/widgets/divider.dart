import 'package:flutter/material.dart';


class DividerWidget extends StatefulWidget {
  State<DividerWidget> createState() {
    return DividerWidgetState();
  }
}

class DividerWidgetState extends State<DividerWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DividerWidget",
        ),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    child: Text("Container 1"),
                      width: double.infinity,
                      height: 200,
                      color: Colors.orange
                  ),
                  Divider(
                    thickness: 30,
                    height: 55,
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 40,
                  ),
                  Container(
                    child: Text("Containter 2"),
                      width: double.infinity,
                      height: 200,
                      color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
