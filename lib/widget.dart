import 'package:flutter/material.dart';
import 'package:waterconservation/widgets/alert.dart';
import 'package:waterconservation/widgets/aspectration.dart';
import 'package:waterconservation/widgets/colorfilter.dart';
import 'package:waterconservation/widgets/divider.dart';
import 'package:waterconservation/widgets/flexible.dart';
import 'package:waterconservation/widgets/ignore.dart';
import 'package:waterconservation/widgets/richtext.dart';
import 'package:waterconservation/widgets/selectabletext.dart';
import 'package:waterconservation/widgets/sizedbox.dart';
import 'package:waterconservation/widgets/spacer.dart';
import 'package:waterconservation/widgets/tooltip.dart';


class WidgetPage extends StatefulWidget {
  State<WidgetPage> createState() {
    return WidgetPageState();
  }
}

class WidgetPageState extends State<WidgetPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Try Out Widgets",
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[

                SizedBox(
                  child: new Column(
                    children: <Widget>[
                      /// Alert
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 118,
                          right: 118,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlertWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "Alert",
                            style: TextStyle(
                              fontSize: 20
                            ),),
                          ],
                        ),
                      ),

                      /// RickText
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 118,
                          right: 118,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RichWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "RichText",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      /// SelectableText
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SelectableWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "SelectableWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Flexible Click
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => FlexibleWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "FlexibleWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      /// Spacer
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SpacerWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "SpacerWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Divider
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DividerWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "DividerWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Ignore Pointers
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => IgnoreWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "IgnoreWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Color Filter
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ColorFilterWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "ColorFilterWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Tool Tips
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 90,
                          right:90,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ToolTipWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "ToolTipWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Aspect Ratio
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 80,
                          right: 80,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AspectRationWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "AspectRationWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                      ///Sized Box
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.only(
                          left: 80,
                          right: 80,
                          top: 8,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SizedBoxWidget()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 3),
                            Text(
                              "SizedBoxWidget",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
          ),
      ),
      );
  }

}
