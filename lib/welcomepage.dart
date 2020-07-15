import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterconservation/homepage.dart';
import 'package:waterconservation/loginpage.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebase = FirebaseAuth.instance;
  String iflogin='';


  LoggedIn() async{
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


  Future<FirebaseUser> _signIn(BuildContext context) async{
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);


    FirebaseUser userDetails = (await firebase.signInWithCredential(credential)).user;
    Navigator.push(context, MaterialPageRoute(builder:  (context) => HomePage(googleSignIn)));

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userIDSPKey', userDetails.uid);
    prefs.setString('loginSP',userDetails.email);
    return userDetails;
  }


  void initState() {
    super.initState();
    LoggedIn();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'AOL WaterConservation',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:Container(
        child: Builder(
          builder: (context) => Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                    'https://images.unsplash.com/photo-1587613753310-0ba642887227?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                    fit: BoxFit.fill,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    colorBlendMode: BlendMode.modulate),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Color(0xffffffff),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.mailBulk,
                                color: Colors.purple,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Sign in with Email',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                        ),
                      )),
                  Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Color(0xffffffff),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.green,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ],
                          ),
                          onPressed: () => _signIn(context),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}



