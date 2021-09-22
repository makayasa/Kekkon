import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kekkon/utils/firebase_auth.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFFCDD2),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Image.asset("assets/images/icon/wedding-rings.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "KEKKON",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 40.0, left: 35.0, right: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Masukkan Email"),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: "Masukkan Password"),
                    ),
                    const SizedBox(height: 10.0),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: Text("Login"),
                      onPressed: ()async {
                        if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                          print("Email dan Password Tidak Boleh Kosong");
                          return;
                        }
                        bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                        if(!res) {
                          AlertDialog(
                            title: Text('Login gagal'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: (){},
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0xffffffff),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xffCE107C),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              ],
                            ),
                            onPressed: () async{
                              bool res = await AuthProvider().loginWithGoogle();
                              if(!res)
                              print("error login dengan google");
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "For Your Special Day",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
