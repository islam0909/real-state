import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mob/GUI/detail.dart';
import 'package:mob/GUI/login.dart';
import 'package:mob/GUI/detail_S.dart';

class Depart extends StatefulWidget {
  @override
  _DepartState createState() => _DepartState();
}

class _DepartState extends State<Depart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.blue[700],
            title: new Text("التصنيفات"),
            actions: [
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade700,
                    ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      Text(" خروج"),
                    ],
                  )),
            ],
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.domain_sharp),
                  child: new Text("الشقق"),
                ),
                Tab(
                  icon: Icon(Icons.apartment),
                  child: new Text("مكاتب"),
                ),
                Tab(
                  icon: Icon(Icons.house),
                  child: new Text("منازل"),
                ),
                Tab(
                  icon: Icon(Icons.landscape),
                  child: new Text("اراضي"),
                ),
                Tab(
                  icon: Icon(Icons.landscape_sharp),
                  child: new Text("مزارع"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  height: 100,
                  width: 100,
                  child: departcard(),
                ),
              ),
              Container(
                height: 100,
                child: officecard(),
              ),
              Container(
                height: 100,
                child: house(),
              ),
              Container(
                height: 100,
                width: 100,
                child: lands(),
              ),
              Container(
                height: 100,
                width: 100,
                child: farms(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget departcard() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Depart').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(children: [
                  Card(
                    elevation: 4,
                    shadowColor: Colors.black87,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    title: document['apart_title'],
                                    area: document['apart_area'],
                                    image: document['apart_img'],
                                    location: document['apart_location'],
                                    price: document['apart_price'],
                                    // name: document['owner_name'],
                                    // phone: document['owner_phone'],
                                    // email: document['owner_email'],
                                     bathroom: document['bathroom'],
                                      hole: document['hole'],
                                       kitchen: document['kitchen'],
                                        room: document['room'],
                                    //username: document['name'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        document['apart_title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade800),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  document['apart_price'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.price_change,
                                                  color: Colors.green.shade300,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          document[
                                                              'apart_area'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(
                                                          Icons.space_bar,
                                                          color: Colors
                                                              .blue.shade300,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          document[
                                                              'apart_location'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(
                                                          Icons.location_pin,
                                                          color: Colors
                                                              .blue.shade300,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: 90,
                                height: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    document['apart_img'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 5,
                  //   left: 2,
                  //   child: Center(
                  //       child: Image.network(
                  //     document['type'],
                  //     width: 50,
                  //     height: 40,
                  //   )),
                  // ),
                ]);
                // new ListTile(
                //   title: Text(document['post_title']),
                //   subtitle: Text(document['post_description']),
                // );
              }).toList(),
            );
        }
      },
    );
  }

  Widget officecard() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Office').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(children: [
                  Card(
                     elevation: 4,
                    shadowColor: Colors.black87,
                    child: InkWell(
                      onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detailtwo(
                                    title: document['office_title'],
                                    area: document['office_area'],
                                    image: document['office_img'],
                                    location: document['office_location'],
                                    price: document['office_price'],
                                    // name: document['owner_name'],
                                    // phone: document['owner_phone'],
                                    // email: document['owner_email'],
                                    // whatsapp:document['owner_whats'] ,
                                    
                                    //username: document['name'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        document['office_title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade800),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  document['office_price'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.price_change,
                                                  color: Colors.green.shade300,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          document['office_area'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(
                                                          Icons.space_bar,
                                                          color: Colors
                                                              .blue.shade300,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          document[
                                                              'office_location'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(
                                                          Icons.location_pin,
                                                          color: Colors
                                                              .blue.shade300,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                           Container(
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      document['office_img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 5,
                  //   left: 2,
                  //   child: Center(
                  //       child: Image.network(
                  //     document['type'],
                  //     width: 50,
                  //     height: 40,
                  //   )),
                  // ),
                ]);
                // new ListTile(
                //   title: Text(document['post_title']),
                //   subtitle: Text(document['post_description']),
                // );
              }).toList(),
            );
        }
      },
    );
  }

  Widget house() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('House').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(
                  children:[
                     Card(
                     elevation: 4,
                      shadowColor: Colors.black87,
                    child: InkWell(
                      onTap:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    title: document['house_title'],
                                    area: document['house_area'],
                                    image: document['house_img'],
                                    location: document['house_location'],
                                    price: document['house_price'],
                                    // name: document['owner_name'],
                                    // phone: document['owner_phone'],
                                    // email: document['owner_email'],
                                     bathroom: document['bathroom'],
                                      hole: document['hole'],
                                       kitchen: document['kitchen'],
                                        room: document['room'],
                                    //username: document['name'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        document['house_title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade800),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  document['house_price'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.price_change,
                                                  color: Colors.green.shade300,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          document['house_area'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Icon(
                                                          Icons.space_bar,
                                                          color:
                                                              Colors.blue.shade300,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          document[
                                                              'house_location'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Colors.blue.shade300,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                           Container(
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      document['house_img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                    // Positioned(
                    // top: 5,
                    // left: 2,
                    // child: Center(
                    //     child: Image.network(
                    //   document['type'],
                    //   width: 50,
                    //   height: 40,
                    // ),
                    // ),
                    // ),
                  ]
                );
                // new ListTile(
                //   title: Text(document['post_title']),
                //   subtitle: Text(document['post_description']),
                // );
              }).toList(),
            );
        }
      },
    );
  }

  Widget lands() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Land').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(
                  children:[
                     Card(
                     elevation: 4,
                      shadowColor: Colors.black87,
                    child: InkWell(
                       onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detailtwo(
                                    title: document['land_title'],
                                    area: document['land_area'],
                                    image: document['land_img'],
                                    location: document['land_location'],
                                    price: document['land_price'],
                                    // name: document['owner_name'],
                                    // phone: document['owner_phone'],
                                    // email: document['owner_email'],
                                    // whatsapp:document['owner_whats'] ,
                                    //username: document['name'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        document['land_title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade800),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  document['land_price'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.price_change,
                                                  color: Colors.green.shade300,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          document['land_area'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Icon(
                                                          Icons.space_bar,
                                                          color:
                                                              Colors.blue.shade300,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          document['land_location'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Colors.blue.shade300,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                           Container(
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      document['land_img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 5,
                  //   left: 2,
                  //   child: Center(
                  //       child: Image.network(
                  //     document['type'],
                  //     width: 50,
                  //     height: 40,
                  //   ),
                  //   ),
                  //   ),
                  ]

                );
                // new ListTile(
                //   title: Text(document['post_title']),
                //   subtitle: Text(document['post_description']),
                // );
              }).toList(),
            );
        }
      },
    );
  }

  Widget farms() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Farm').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(
                  children:[
                     Card(
                     elevation: 4,
                      shadowColor: Colors.black87,
                    child: InkWell(
                       onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detailtwo(
                                    title: document['farm_title'],
                                    area: document['farm_area'],
                                    image: document['farm_img'],
                                    location: document['farm_location'],
                                    price: document['farm_price'],
                                    // name: document['owner_name'],
                                    // phone: document['owner_phone'],
                                    // email: document['owner_email'],
                                    // whatsapp: document['owner_whats'],
                                    
                                    //username: document['name'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        document['farm_title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade800),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  document['farm_price'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.price_change,
                                                  color: Colors.green.shade300,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          document['farm_area'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Icon(
                                                          Icons.space_bar,
                                                          color:
                                                              Colors.blue.shade300,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          document['farm_location'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Colors.blue.shade300,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                           Container(
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      document['farm_img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 5,
                  //   left: 2,
                  //   child: Center(
                  //       child: Image.network(
                  //     document['type'],
                  //     width: 50,
                  //     height: 40,
                  //   ),
                  //   ),
                  //   ),
                  ]

                );
                // new ListTile(
                //   title: Text(document['post_title']),
                //   subtitle: Text(document['post_description']),
                // );
              }).toList(),
            );
        }
      },
    );
  }
}
