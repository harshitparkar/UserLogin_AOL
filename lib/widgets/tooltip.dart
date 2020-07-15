import 'package:flutter/material.dart';


class ToolTipWidget extends StatefulWidget {
  State<ToolTipWidget> createState() {
    return ToolTipWidgetState();
  }
}

class ToolTipWidgetState extends State<ToolTipWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "ToolTipWidget",
        ),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Tooltip(
                    message: "You are holding",
                    child: Image.network(
                      "https://logos.flamingtext.com/Word-Logos/hold-design-fluffy-name.png",
                      height: 400,
                      width: 400,
                    ),
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
