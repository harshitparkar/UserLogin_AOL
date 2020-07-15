import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterconservation/widget.dart';

class HomePage extends StatefulWidget {
  GoogleSignIn _googledetails;
  HomePage(GoogleSignIn googledetails) {
    this._googledetails = googledetails;
  }
  @override
  _HomePageState createState() => _HomePageState(_googledetails);
}

class _HomePageState extends State<HomePage> {
  GoogleSignIn googleSignIn;

  _HomePageState(GoogleSignIn good) {
    this.googleSignIn = good;
  }

  String emailSP = '';
  String userId = '';
  String name = '';
  String email = '';
  String age = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userIDSPKey');

    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    debugPrint("UserId:" + userId);
    DatabaseReference databaseReference =
    firebaseDatabase.reference().child("userData").child(userId);
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      // dataSnapshot.value['name'].toString();
      setState(() {
        name = dataSnapshot.value['name'].toString();
        gender = dataSnapshot.value['gender'].toString();
        age = dataSnapshot.value['age'].toString();
        email = dataSnapshot.value['email'].toString();
      });
    });
  }

  _logout() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userIDSPKey', '');
      prefs.setString('loginSP', "nomail");
    });
    for (String key in prefs.getKeys()) {
      if (key !=null) {
        prefs.remove(key);
        googleSignIn.signOut();
      }
    }
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'NAME: $name',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'E-MAIL: $email',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'GENDER: $gender',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'AGE: $age',
              ),
            ),


            SizedBox(height: 15,),
            SizedBox(

              child: RaisedButton(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.only(
                  left: 48,
                  right: 48,
                  top: 8,
                  bottom: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  googleSignIn.signOut().toString();
                  _logout();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Logout",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),
            SizedBox(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.only(
                  left: 48,
                  right: 48,
                  top: 8,
                  bottom: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  //  debugPrint(googleSignIn.signOut().toString());
                  //  debugPrint('OK');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddData()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Edit Profile",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),
            SizedBox(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.only(
                  left: 48,
                  right: 48,
                  top: 8,
                  bottom: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WidgetPage()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.fiber_new,
                    ),
                    SizedBox(width: 4),
                    Text(
                      " See Flutter Widgets",
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  String id, name, gender, age, userId, email;
  TextEditingController Namecontroller = new TextEditingController();
  TextEditingController Gendercontroller = new TextEditingController();
  TextEditingController Agecontroller = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  @override
  void initState() {
    super.initState();
    retriveData();
  }

  retriveData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userIDSPKey');
      email = prefs.getString('loginSP');
    });
  }

  void addData() {
    if (_formKey.currentState.validate()) {
      name = Namecontroller.text;
      gender = Gendercontroller.text;
      age = Agecontroller.text;
      FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
      DatabaseReference databaseReference = firebaseDatabase.reference();
      databaseReference.child("userData").child(userId)..set({
        "name": name,
        "gender": gender,
        "age": age,
        "email": email,
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Adding Details...")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the AddData object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Edit Profile"),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Namecontroller,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter name",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "name cannot be empty";
                      } else
                        return null;
                    },
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Gendercontroller,
                    decoration: InputDecoration(
                      labelText: "Gender",
                      hintText: "Enter Gender",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "Gender cannot be empty";
                      } else
                        return null;
                    },
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Agecontroller,
                    decoration: InputDecoration(
                      labelText: "Age",
                      hintText: "Enter age",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "Age cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      addData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(googleSignIn)));
                    },
                    padding: EdgeInsets.all(15),
                    child: Text("Add data"),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
