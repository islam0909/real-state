import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addoffice extends StatefulWidget {
  const Addoffice({Key? key}) : super(key: key);

  @override
  _AddofficeState createState() => _AddofficeState();
}

class _AddofficeState extends State<Addoffice> {
  TextEditingController office_number = TextEditingController();
  TextEditingController office_title = TextEditingController();
  TextEditingController office_location = TextEditingController();
  TextEditingController office_area = TextEditingController();
  TextEditingController office_price = TextEditingController();
  TextEditingController office_img = TextEditingController();
  final Firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await Firebase.collection("Office")
          .doc(office_number.text)
          .set({
            "office_number": office_number.text,
             "office_title": office_title.text,
             "office_location":office_location.text,
             "office_area":office_area.text,
             "office_price":office_price.text,
             "office_img":office_img.text,

             });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      Firebase.collection("Office").doc(office_number.text).update({
        
     "office_title": office_title.text,
             "office_location":office_location.text,
             "office_area":office_area.text,
             "office_price":office_price.text,
             "office_img":office_img.text,
      
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      Firebase.collection("Office").doc(office_number.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('اضافة مكتب')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.right,
                controller: office_number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: " رقم المكتب",
                   
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
                controller: office_title,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عنوان المكتب",
                   
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
                controller: office_location,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "موقع المكتب",
                   
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
                controller: office_area,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "مساحة المكتب",
                   
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
                controller: office_price,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "سعر المكتب",
                   
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
                controller: office_img,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "رابط صورة المكتب  ",
                   
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
                      office_number.clear();
                      office_title.clear();
                      office_location.clear();
                      office_area.clear();
                      office_price.clear();
                      office_img.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: Text("تعديل"),
                    onPressed: () {
                      update();
                      office_number.clear();
                      office_title.clear();
                      office_location.clear();
                      office_area.clear();
                      office_price.clear();
                      office_img.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("حذف"),
                    onPressed: () {
                      delete();
                      office_number.clear();
                      office_title.clear();
                      office_location.clear();
                      office_area.clear();
                      office_price.clear();
                      office_img.clear();
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
