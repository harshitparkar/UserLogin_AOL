import 'package:flutter/material.dart';


class SizedBoxWidget extends StatefulWidget {
  State<SizedBoxWidget> createState() {
    return SizedBoxWidgetState();
  }
}

class SizedBoxWidgetState extends State<SizedBoxWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SizedBoxWidget",
        ),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text("Text & Image inside SizedBox"),
                          Image.network(
                            "https://pbs.twimg.com/profile_images/479556805610045440/6rjgCQ8m.jpeg",
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
