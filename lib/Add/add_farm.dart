import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addfarm extends StatefulWidget {
  const Addfarm({Key? key}) : super(key: key);

  @override
  _AddfarmState createState() => _AddfarmState();
}

class _AddfarmState extends State<Addfarm> {
  TextEditingController farm_number = TextEditingController();
  TextEditingController farm_title = TextEditingController();
  TextEditingController farm_location = TextEditingController();
  TextEditingController farm_area = TextEditingController();
  TextEditingController farm_price = TextEditingController();
  TextEditingController farm_img = TextEditingController();
  final Firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await Firebase.collection("Farm")
          .doc(farm_number.text)
          .set({
            "farm_number": farm_number.text,
             "farm_title": farm_title.text,
             "farm_location":farm_location.text,
             "farm_area":farm_area.text,
             "farm_price":farm_price.text,
             "farm_img":farm_img.text,

             });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      Firebase.collection("Farm").doc(farm_number.text).update({
        
     "farm_title": farm_title.text,
             "farm_location":farm_location.text,
             "farm_area":farm_area.text,
             "farm_price":farm_price.text,
             "farm_img":farm_img.text,
      
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      Firebase.collection("Farm").doc(farm_number.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('اضافة مزرعة')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              TextField(
                textAlign: TextAlign.right,
                controller: farm_number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: " رقم المزرعة",
                   
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.right,
                controller: farm_title,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عنوان المزرعة",
                   
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.right,
                controller: farm_location,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "موقع المزرعة",
                   
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.right,
                controller: farm_area,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "مساحة المزرعة",
                   
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.right,
                controller: farm_price,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "سعر المزرعة",
                   
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.right,
                controller: farm_img,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "رابط صورة المزرعة  ",
                   
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    child: Text("اضافة"),
                    onPressed: () {
                      create();
                      farm_number.clear();
                      farm_title.clear();
                      farm_location.clear();
                      farm_area.clear();
                      farm_price.clear();
                      farm_img.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: Text("تعديل"),
                    onPressed: () {
                      update();
                     farm_number.clear();
                      farm_title.clear();
                      farm_location.clear();
                      farm_area.clear();
                      farm_price.clear();
                      farm_img.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("حذف"),
                    onPressed: () {
                      delete();
                     farm_number.clear();
                      farm_title.clear();
                      farm_location.clear();
                      farm_area.clear();
                      farm_price.clear();
                      farm_img.clear();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
