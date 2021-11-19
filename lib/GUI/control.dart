import 'package:flutter/material.dart';
import 'package:mob/Add/add_depart.dart';
import 'package:mob/Add/add_farm.dart';
import 'package:mob/Add/add_house.dart';
import 'package:mob/Add/add_land.dart';
import 'package:mob/Add/add_office.dart';
import 'package:mob/GUI/login.dart';

class Controlpanel extends StatefulWidget {
  const Controlpanel({ Key? key }) : super(key: key);

  @override
  _ControlpanelState createState() => _ControlpanelState();
}

class _ControlpanelState extends State<Controlpanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
         Text(
           "لوحة التحكم",
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 23,
           ),
        )),
        backgroundColor:Colors.blue[700]
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              color: Colors.blue[700],
              elevation: 5,
        child: InkWell(
          onTap: (){
            Navigator.push(
context,MaterialPageRoute(builder: (context) => Addland()),);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/land.png",
                width: 80,
                height: 60,
                ),
                Text(
                  "اضافة ارض",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
            Card(
              color: Colors.blue[700],
              elevation: 5,
        child: InkWell(
          onTap: (){
             Navigator.push(
context,MaterialPageRoute(builder: (context) => Addhouse()),);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/houses.png",
                width: 80,
                height: 60,
                ),
                Text(
                  "اضافة منزل",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
            Card(
              color: Colors.blue[700],
              elevation: 5,
        child: InkWell(
          onTap: (){
             Navigator.push(
context,MaterialPageRoute(builder: (context) => Addoffice()),);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/offices.png",
                width: 80,
                height: 60,
                ),
                Text(
                  "اضافة مكتب",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
            Card(
              color: Colors.blue[700],
              elevation: 5,
        child: InkWell(
          onTap: (){
             Navigator.push(
context,MaterialPageRoute(builder: (context) => Addapart()),);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/apartment.png",
                width: 80,
                height: 60,
                ),
                Text(
                  " اضافة شقة",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
            Card(
              color: Colors.blue[700],
              elevation: 5,
        child: InkWell(
          onTap: (){
             Navigator.pushReplacement(
context,MaterialPageRoute(builder: (context) => LoginScreen()),);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/back.png",
                width: 80,
                height: 60,
                ),
                Text(
                  " الرجوع",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
            Card(
              color: Colors.blue[700],
              elevation: 5,
        child: InkWell(
          onTap: (){
             Navigator.push(
context,MaterialPageRoute(builder: (context) => Addfarm()),);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/farm.png",
                width: 80,
                height: 60,
                ),
                Text(
                  "اضافة مزرعة",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          ],
          )
      )
      
    );
  }
}