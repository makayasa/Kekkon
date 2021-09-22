import 'package:flutter/material.dart';
import '../main.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      image: Image.asset("assets/images/icon/wedding-rings.png"),
      photoSize: 50,
      title: Text(
        "KEKKON",
        style: TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      loadingText: Text(
        "For Your Special Day",
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color(0xffFFCDD2),
      navigateAfterSeconds: MainScreen(),
    );
  }
}
