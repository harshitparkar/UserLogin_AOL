import 'package:flutter/material.dart';

class ColorFilterWidget extends StatefulWidget {
  State<ColorFilterWidget> createState() {
    return ColorFilterWidgetState();
  }
}

class ColorFilterWidgetState extends State<ColorFilterWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ColorFilterWidget",
        ),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text("Color Original"),
                        Image.network(
                          "https://htmlcolorcodes.com/assets/images/html-color-codes-color-palette-generators-hero-509156f7.jpg",
                          width: 250,
                          height: 250,
                        ),
                      ],
                    ),
                  ),


                  Container(
                    child: Row(
                      children: <Widget>[
                        Text("Color Filtered"),
                        ColorFiltered(
                          colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.color),
                          child: Image.network("https://htmlcolorcodes.com/assets/images/html-color-codes-color-palette-generators-hero-509156f7.jpg",
                            width: 250,
                            height: 250,
                          ),
                        ),
                      ],
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
