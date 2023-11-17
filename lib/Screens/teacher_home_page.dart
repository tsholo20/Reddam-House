import 'package:cce_reddam_house/Screens/teacher_profile.dart';
import 'package:cce_reddam_house/components/drawer.dart';
import 'package:cce_reddam_house/screens/search_page.dart'; 
import 'package:cce_reddam_house/Screens/view_receipts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cce_reddam_house/Screens/teacher_policy.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherHomePage extends StatefulWidget {
  final Function()? onTap;
  const TeacherHomePage({Key? key, this.onTap}) : super(key: key);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  // void goToUploadPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => TimeTablePage(),
  //     ),
  //   );
  // }

  void goToPolicyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeacherPolicyPage(),
      ),
    );
  }

  void goToReceipts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyReceiptsPage(),
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser;

  //navigate to ptofile page
  void goToProfilePage() {
    //pop the menu drawer
    Navigator.pop(context);

    //go to a new page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeacherProfilePage(),
        ));
  }

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 3, 34, 59)),
        drawer: MyDrawer(
          onProfileTap: goToProfilePage,
          onSignOut: signUserOut,
          onSearch: goToSearchPage,
        ),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 36.0),
              child: Text("Dashboard",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 34, 59),
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 2.0,
                  ))),
          Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                  child: Wrap(spacing: 20.0, runSpacing: 20.0, children: [
                //InkWell(
                //onTap: goToUploadPage,
                //child:
                SizedBox(
                    width: 140.0,
                    height: 150.0,
                    child: Card(
                      color: Color(0xffa49831),
                      child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(children: [
                            Image.asset('lib/images/ttable.png',
                                width: 40.0, height: 40.0),
                            SizedBox(height: 20.0),
                            Text("Timetable",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 3, 34, 59),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                )),
                          ])),
                      //),
                    )),
    
            InkWell(
                  onTap: goToReceipts,
                  child: SizedBox(
                      width: 140.0,
                      height: 180.0,
                      child: Card(
                        color: Color(0xffa49831),
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(children: [
                              Image.asset('lib/images/receipt.png',
                                  width: 40.0, height: 40.0),
                              SizedBox(height: 20.0),
                              Text("Receipts",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 3, 34, 59),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ))
                            ])),
                      )),
                ),
                SizedBox(
                    width: 140.0,
                    height: 150.0,
                    child: Card(
                        color: Color(0xffa49831),
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(children: [
                              Image.asset('lib/images/clock.png',
                                  width: 40.0, height: 40.0),
                              SizedBox(height: 20.0),
                              Text("Hours",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 3, 34, 59),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ))
                            ])))),
                InkWell(
                    onTap: goToPolicyPage,
                    child: SizedBox(
                        width: 140.0,
                        height: 180.0,
                        child: Card(
                            color: Color(0xffa49831),
                            child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(children: [
                                  Image.asset('lib/images/policy.png',
                                      width: 40.0, height: 40.0),
                                  SizedBox(height: 20.0),
                                  Text("Ts & Cs",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 3, 34, 59),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ))
                                ]))))),
              ])))
        ])));
  }
}
