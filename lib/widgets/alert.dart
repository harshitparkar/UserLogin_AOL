import 'package:flutter/material.dart';


class AlertWidget extends StatefulWidget {
  State<AlertWidget> createState() {
    return AlertWidgetState();
  }
}

class AlertWidgetState extends State<AlertWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alert",
        ),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () {
                alertPopUp(context);
              },
              child: Text('click me'),
            ),
          ],
        ),
      ),
    );
  }
  void alertPopUp(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Hey Hi"),
          content: new Text("This is Alert Pop Up"),
          actions: <Widget>[
          ],
        );
      },
    );
  }

}
