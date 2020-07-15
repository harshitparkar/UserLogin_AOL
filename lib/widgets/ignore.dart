import 'package:flutter/material.dart';


class IgnoreWidget extends StatefulWidget {
  State<IgnoreWidget> createState() {
    return IgnoreWidgetState();
  }
}

class IgnoreWidgetState extends State<IgnoreWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "IgnoreWidget",
        ),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: RaisedButton(
                      onPressed: () {
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('I am Ignored :-(')));
                      },
                      child: Text("I am Ignored :-("),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('I am not Ignored :-)')));
                    },
                    child: Text("Try Me :-)"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
