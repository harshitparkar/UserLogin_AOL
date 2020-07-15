import 'package:firebase_auth/firebase_auth.dart';
import 'package:waterconservation/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  State<SignUpPage> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _signupPageScaffoldAppBar(),
      body: Builder(builder: _signUpPageSaffoldBody),
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailLoginFormTextEditingController = new TextEditingController();
  TextEditingController _passwordLoginFormTextEditingController = new TextEditingController();

  void initState() {
    super.initState();
  }

  _signUpUsingFirebase(String email, String password) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
        .then((AuthResult authResult) {
          debugPrint("Succesfully Added");
          FirebaseUser user = authResult.user;
          return user.uid;
    }).catchError((error) {
      debugPrint(error);
    });
  }

  Widget _signUpPageSaffoldBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          Center(
            child: Icon(
              Icons.person,
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
          TextFormField(
            controller: _passwordLoginFormTextEditingController,
            obscureText: true,
            validator: (String content) {
              if (content.length < 2) {
                return "Minimum 8 digit password";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter Your Password",
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
                _signUpUsingFirebase(_emailLoginFormTextEditingController.text,
                    _passwordLoginFormTextEditingController.text);
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

  Widget _signupPageScaffoldAppBar() {
    return AppBar(
      title: Text(
        "Sign Up",
      ),
    );
  }
}
