import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addapart extends StatefulWidget {
  const Addapart({Key? key}) : super(key: key);

  @override
  _AddapartState createState() => _AddapartState();
}

class _AddapartState extends State<Addapart> {
  TextEditingController apart_number = TextEditingController();
  TextEditingController apart_title = TextEditingController();
  TextEditingController apart_location = TextEditingController();
  TextEditingController apart_area = TextEditingController();
  TextEditingController apart_price = TextEditingController();
  TextEditingController apart_img = TextEditingController();
  TextEditingController bathroom = TextEditingController();
  TextEditingController kitchen = TextEditingController();
  TextEditingController hole = TextEditingController();
  TextEditingController room = TextEditingController();
  final Firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await Firebase.collection("Depart").doc(apart_number.text).set({
        "apart_number": apart_number.text,
        "apart_title": apart_title.text,
        "apart_location": apart_location.text,
        "apart_area": apart_area.text,
        "apart_price": apart_price.text,
        "apart_img": apart_img.text,
        "bathroom": bathroom.text,
        "kitchen": kitchen.text,
        "hole": hole.text,
        "room": room.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      Firebase.collection("Depart").doc(apart_number.text).update({
        "apart_title": apart_title.text,
        "apart_location": apart_location.text,
        "apart_area": apart_area.text,
        "apart_price": apart_price.text,
        "apart_img": apart_img.text,
        "bathroom": bathroom.text,
        "kitchen": kitchen.text,
        "hole": hole.text,
        "room": room.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      Firebase.collection("Depart").doc(apart_number.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('اضافة شقة')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.right,
                controller: apart_number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "رقم الشقة",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: apart_title,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عنوان الشقة",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: apart_location,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "موقع الشقة",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: apart_area,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "مساحة الشقة",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: apart_price,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "سعر الشقة",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: apart_img,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "رابط صورة الشقة  ",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: bathroom,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عدد الحمامات   ",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: kitchen,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عدد الصالات   ",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: hole,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عدد المطابخ   ",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: room,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عدد الغرف   ",
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
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
                      apart_number.clear();
                      apart_title.clear();
                      apart_location.clear();
                      apart_area.clear();
                      apart_price.clear();
                      apart_img.clear();
                      bathroom.clear();
                      kitchen.clear();
                      hole.clear();
                      room.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: Text("تعديل"),
                    onPressed: () {
                      update();
                      apart_number.clear();
                      apart_title.clear();
                      apart_location.clear();
                      apart_area.clear();
                      apart_price.clear();
                      apart_img.clear();
                      bathroom.clear();
                      kitchen.clear();
                      hole.clear();
                      room.clear();
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("حذف"),
                    onPressed: () {
                      delete();
                    apart_number.clear();
                      apart_title.clear();
                      apart_location.clear();
                      apart_area.clear();
                      apart_price.clear();
                      apart_img.clear();
                      bathroom.clear();
                      kitchen.clear();
                      hole.clear();
                      room.clear();
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
