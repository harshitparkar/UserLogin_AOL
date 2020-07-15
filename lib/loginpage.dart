import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterconservation/homepage.dart';
import 'package:waterconservation/resetpage.dart';
import 'package:waterconservation/signup.dart';



class LoginPage extends StatefulWidget {
  State<LoginPage> createState() {
    return LoginPageState();
  }
}



class LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Login Using Email  ",
        ),
      ),
      body: Builder(
        builder: _loginPageSaffoldBody,
      ),
    );
  }





  @override
  void initState() {
    super.initState();
    alreadyLoggedIn();

  }

  alreadyLoggedIn() async{
    final prefs = await SharedPreferences.getInstance();
    iflogin = prefs.getString('loginSP')?? "empty";
    // ddd
    if(iflogin != "empty"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(googleSignIn)));
    }
    else {
      iflogin="empty";
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailLoginFormTextEditingController = TextEditingController();
  TextEditingController _passwordLoginFormTextEditingController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String iflogin='';
  final GoogleSignIn googleSignIn = new GoogleSignIn();



  _signInUsingFirebase(String email, String pass) {
    FirebaseAuth fire = FirebaseAuth.instance;
    fire
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((AuthResult authResult) async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(googleSignIn)));
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userIDSPKey', authResult.user.uid);
      prefs.setString('loginSP', email);
    }).catchError((error) {
      final snackBar = SnackBar(content: Text("Please Enter correct Email and Password"));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }

  Widget _loginPageSaffoldBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
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
                _signInUsingFirebase(_emailLoginFormTextEditingController.text,
                    _passwordLoginFormTextEditingController.text);
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ResetPage(),
              ));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.settings_backup_restore,
                ),
                SizedBox(width: 4),
                Text(
                  "Reset",
                ),
              ],
            ),
          ), // Reset Button
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.fiber_new,
                ),
                SizedBox(width: 4),
                Text(
                  "Sign Up",
                ),
              ],
            ),
          ),// Sign Up
        ],
      ),
    );
  }
}
