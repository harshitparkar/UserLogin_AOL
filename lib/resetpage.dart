import 'package:firebase_auth/firebase_auth.dart';
import 'package:waterconservation/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  State<ResetPage> createState() {
    return ResetPageState();
  }
}

class ResetPageState extends State<ResetPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _resetPageScaffoldAppBar(),
      body: Builder(builder: _resetPageSaffoldBody),
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailLoginFormTextEditingController = new TextEditingController();

  void initState() {
    super.initState();
  }

  _resetUsingFirebase(String email,) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.sendPasswordResetEmail(email: email);
    debugPrint("Succesfully Sent");
  }

  Widget _resetPageSaffoldBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          Center(
            child: Icon(
              Icons.settings_backup_restore,
              size: 128,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _emailLoginFormTextEditingController,
            validator: (String content) {
              if (content.length == 0) {
                return "Please enter valid email";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter Your Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(
              left: 48,
              right: 48,
              top: 8,
              bottom: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              // If statement is validating the input fields.
              if (_formKey.currentState.validate()) {
                _resetUsingFirebase(_emailLoginFormTextEditingController.text,);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.lock_open,
                ),
                SizedBox(width: 4),
                Text(
                  "Submit",
                ),
              ],
            ),
          ), // Submit Button
        ],
      ),
    );
  }

  Widget _resetPageScaffoldAppBar() {
    return AppBar(
      title: Text(
        "Password Reset",
      ),
    );
  }
}
