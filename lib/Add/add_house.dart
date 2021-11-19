import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addhouse extends StatefulWidget {
  const Addhouse({Key? key}) : super(key: key);

  @override
  _AddhouseState createState() => _AddhouseState();
}

class _AddhouseState extends State<Addhouse> {
  TextEditingController house_number = TextEditingController();
  TextEditingController house_title = TextEditingController();
  TextEditingController house_location = TextEditingController();
  TextEditingController house_area = TextEditingController();
  TextEditingController house_price = TextEditingController();
  TextEditingController house_img = TextEditingController();
  TextEditingController bathroom = TextEditingController();
  TextEditingController kitchen = TextEditingController();
  TextEditingController hole = TextEditingController();
  TextEditingController room = TextEditingController();
  final Firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await Firebase.collection("House").doc(house_number.text).set({
        "house_number": house_number.text,
        "house_title": house_title.text,
        "house_location": house_location.text,
        "house_area": house_area.text,
        "house_price": house_price.text,
        "house_img": house_img.text,
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
      Firebase.collection("House").doc(house_number.text).update({
        "house_title": house_title.text,
        "house_location": house_location.text,
        "house_area": house_area.text,
        "house_price": house_price.text,
        "house_img": house_img.text,
        "bathroom": bathroom.text,
        "kitchen": kitchen.text,
        "hole": hole.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      Firebase.collection("House").doc(house_number.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('اضافة منزل')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: house_number,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: " رقم المنزل",
                 
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
                controller: house_title,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "عنوان المنزل",
                 
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
                textAlign: TextAlign.right,
                controller: house_location,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "موقع المنزل",
                 
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
                textAlign: TextAlign.right,
                controller: house_area,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "مساحة المنزل",
                 
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
                textAlign: TextAlign.right,
                controller: house_price,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "سعر المنزل",
                 
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
                textAlign: TextAlign.right,
                controller: house_img,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(11),
                  hintText: "رابط صورة المنزل  ",
                 
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
                textAlign: TextAlign.right,
                controller: bathroom,
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
                textAlign: TextAlign.right,
                controller: kitchen,
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
                textAlign: TextAlign.right,
                controller: hole,
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
                textAlign: TextAlign.right,
                controller: room,
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
                      house_number.clear();
                      house_title.clear();
                      house_location.clear();
                      house_area.clear();
                      house_price.clear();
                      house_img.clear();
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
                      house_number.clear();
                      house_title.clear();
                      house_location.clear();
                      house_area.clear();
                      house_price.clear();
                      house_img.clear();
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
                      house_number.clear();
                      house_title.clear();
                      house_location.clear();
                      house_area.clear();
                      house_price.clear();
                      house_img.clear();
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
