import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mob/GUI/Register.dart';
import 'package:mob/GUI/control.dart';
import 'package:mob/GUI/tab.dart';
import 'package:mob/GUI/welcome.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,

              
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight
              )
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36,horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Image.asset(
              "assets/splash1.png",
              height: 120,
            ),
                    
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 

                 
                    TextFormField(
                      controller: _emailcontroller,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email_outlined),
                         contentPadding: EdgeInsets.all(0),
                        hintText: 'الايميل',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                          
                        ),
                       filled: true,
                       fillColor: Color(0xFFe7edeb),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل الايميل';
                        }
                         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("ادخل ايميل صحيح");
          }
          return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                         suffixIcon: Icon(Icons.password_outlined),
                        hintText: 'كلمة المرور',
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                          
                        ),
                         filled: true,
                       fillColor: Color(0xFFe7edeb),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' ادخل كلمة المرور';
                        }
                        if(!RegExp(r'^.{6,}$').hasMatch(value)){
                          return ("ادخل كلمة مرور صحيحة");
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            child: Text(
                              'تسجيل',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade700,
                            ),
                            onPressed: () async {
                              
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            child: Text(
                              'دخول',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade700,
                            ),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                var result = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email:_emailcontroller.text,
                                        password: _passwordcontroller.text);

                                // ignore: unnecessary_null_comparison
                                if (_emailcontroller.text=='admin@gmail.com') {
                                  // pushReplacement

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Controlpanel()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Hello()),
                                  );
                                }
                              }
                            },
                            ),
                      ],
                    ),
                ],
              )
              ),
                  ),
                ),
                )
            ],
          ),
          
        ),
      ),
    );
  }
}
