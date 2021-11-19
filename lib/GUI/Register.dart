import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mob/GUI/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
    _phonecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Center(child: Text('حساب جديد')),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blueGrey.shade700,
                  backgroundImage: AssetImage('assets/register.png'),
                  radius: 50.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "التسجيل",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.right,
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email_outlined),
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'الايميل',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'عذرا الرجاء ادخال الايميل';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("ادخل ايميل صحيح");
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.right,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.password_outlined),
                    hintText: 'كلمة المرور',
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'عذرا الرجاء ادخال كلمة المرور';
                    }
                    if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                      return ("ادخل كلمة مرور صحيحة");
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    child: Text(
                      'انشاء الحساب ',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade700,
                    ),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        var result = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailcontroller.text,
                                password: _passwordcontroller.text);

                        // ignore: unnecessary_null_comparison
                        if (result != null) {
                          // ignore: unused_local_variable

                          var userInfo = await FirebaseFirestore.instance
                              .collection('users')
                              .doc(result.user!.uid)
                              .set({
                            'name': _namecontroller.text,
                            'phone': _phonecontroller.text,
                          });

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        } else {
                          print('please try later');
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
