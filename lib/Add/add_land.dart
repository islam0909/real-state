import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addland extends StatefulWidget {
  const Addland({Key? key}) : super(key: key);

  @override
  _AddlandState createState() => _AddlandState();
}

class _AddlandState extends State<Addland> {
  TextEditingController land_number = TextEditingController();
  TextEditingController land_title = TextEditingController();
  TextEditingController land_location = TextEditingController();
  TextEditingController land_area = TextEditingController();
  TextEditingController land_price = TextEditingController();
  TextEditingController land_img = TextEditingController();
  final Firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await Firebase.collection("Land")
          .doc(land_number.text)
          .set({
            "land_number": land_number.text,
             "land_title": land_title.text,
             "land_location":land_location.text,
             "land_area":land_area.text,
             "land_price":land_price.text,
             "land_img":land_img.text,

             });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      Firebase.collection("Land").doc(land_number.text).update({
        
     "land_title": land_title.text,
             "land_location":land_location.text,
             "land_area":land_area.text,
             "land_price":land_price.text,
             "land_img":land_img.text,
      
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      Firebase.collection("Land").doc(land_number.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('اضافة ارض')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              TextField(
                textAlign: TextAlign.right,
                controller: land_number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: " رقم الارض",
                  
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
                controller: land_title,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عنوان الارض",
                   
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
                controller: land_location,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "موقع الارض",
                   
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
                controller: land_area,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "مساحة الارض",
                   
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
                controller: land_price,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "سعر الارض",
                   
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
                controller: land_img,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "رابط صورة الارض  ",
                   
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
                      land_number.clear();
                      land_title.clear();
                      land_location.clear();
                      land_area.clear();
                      land_price.clear();
                      land_img.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: Text("تعديل"),
                    onPressed: () {
                      update();
                      land_number.clear();
                      land_title.clear();
                      land_location.clear();
                      land_area.clear();
                      land_price.clear();
                      land_img.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("حذف"),
                    onPressed: () {
                      delete();
                      land_number.clear();
                      land_title.clear();
                      land_location.clear();
                      land_area.clear();
                      land_price.clear();
                      land_img.clear();
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
