import 'package:flutter/material.dart';


class AspectRationWidget extends StatefulWidget {
  State<AspectRationWidget> createState() {
    return AspectRationWidgetState();
  }
}

class AspectRationWidgetState extends State<AspectRationWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AspectRationWidget",
        ),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Text("This images is fit in 3:2 ratio"),
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            "https://image.freepik.com/free-vector/number-3-eagle-shape-logo-vector_23987-212.jpg",
                            height: 50,
                            width: 50,
                          ),
                          Image.network(
                            "https://st2.depositphotos.com/3867453/8105/v/950/depositphotos_81057948-stock-illustration-letter-z-number-2-logo.jpg",
                            height: 50,
                            width: 50,
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
