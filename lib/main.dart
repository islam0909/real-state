import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mob/Add/add_depart.dart';
import 'package:mob/Add/add_farm.dart';
import 'package:mob/Add/add_house.dart';
import 'package:mob/Add/add_land.dart';
import 'package:mob/Add/add_office.dart';
import 'package:mob/GUI/control.dart';
import 'package:mob/GUI/detail_S.dart';
//import 'package:mob/GUI/categ.dart';
import 'package:mob/GUI/tab.dart';
import 'package:mob/GUI/login.dart';
import 'package:mob/GUI/Register.dart';
import 'package:mob/GUI/detail.dart';
import 'package:mob/GUI/welcome.dart';
import 'package:mob/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner:false,
    home: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "naviiie",
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new LoginScreen(),
        '/Register': (BuildContext context) => new RegisterScreen(),
        '/Depart': (BuildContext context) => new Depart(),
        '/Details_S': (BuildContext context) => new Detailtwo(
              title: '',
              price: '',
              area: '',
              location: '',
              image: '',
              // name: '',
              // phone: '',
              // email: '',
              // whatsapp: '',
            ),
        '/Details': (BuildContext context) => new Details(
              title: '',
              area: '',
              image: '',
              location: '',
              price: '',
              // name: '',
              // phone: '',
              // email: '',
              bathroom: '',
              hole: '',
              kitchen: '',
              room: '',
            ),
      },
      home: LoginScreen(),
    );
  }
}
