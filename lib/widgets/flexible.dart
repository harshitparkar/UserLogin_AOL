import 'package:flutter/material.dart';


class FlexibleWidget extends StatefulWidget {
  State<FlexibleWidget> createState() {
    return FlexibleWidgetState();
  }
}

class FlexibleWidgetState extends State<FlexibleWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FlexibleWidget",
        ),
      ),
      body: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: 200,
                width: 300,
                color: Colors.blue,
                child: Text("Flex 1"),
              ),
            ),
            Flexible(
              flex: 2,
              child:Container(
                height: 90,
                width: 200,
                color: Colors.red,
                child: Text("Flex 2"),
              ),
            ),
            Flexible(
              flex: 3,
              child:Container(
                height: 90,
                width: 100,
                color: Colors.green,
                child: Text("Flex 3"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
