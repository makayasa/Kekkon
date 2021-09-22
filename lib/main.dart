import 'package:flutter/material.dart';
import 'package:kekkon/pages/dokumentasi.dart';
import 'package:kekkon/pages/home.dart';
import 'package:kekkon/pages/login.dart';
import 'package:kekkon/pages/undangan.dart';
import 'package:kekkon/pages/wanita.dart';
import 'pages/lokasi.dart';
import 'pages/pria.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'pages/musik.dart';
import 'utils/cartmodel.dart';
import 'utils/splash.dart';



void main() => runApp(MyApp());

List<CartItems> listCarts = List<CartItems>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'KEKKON',
      theme: ThemeData(
        fontFamily: 'MaisonNeue',
        primarySwatch: Colors.pink,
      ),
      home: Splash(),
      routes: {
        '/wanita' : (BuildContext context) => Wanita(),
        '/lokasi' : (BuildContext context) => Lokasi(),
        '/pria' : (BuildContext context) => Pria(),
        '/undangan' : (BuildContext context) => Undangan(),
        '/musik' : (BuildContext context) => Musik(),
        '/dokumentasi' : (BuildContext context) => Dokumentasi(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return Splash();
        else if(!snapshot.hasData || snapshot.data == null)
          return Login();
        else return Homes();
      }
    );
  }
}
