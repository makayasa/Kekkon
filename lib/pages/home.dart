import 'package:flutter/material.dart';
import 'package:kekkon/pages/wishlist.dart';
import 'package:kekkon/utils/firebase_auth.dart';


class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: FlutterLogo(),
            ),
            RaisedButton(
              child: Text('Sign out'),
              onPressed: () {
                AuthProvider().logOut();
                },
                ),
          ],
        )
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'KEKKON',
            style: TextStyle(color: Colors.black,fontFamily: 'Montserrat'),
          ),
        ),
        backgroundColor: Colors.pink[200],
        elevation: 1.0,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Wishlist(),
                      ),
                    );
            },
            icon: Icon(Icons.card_giftcard),
          )
        ],
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Banner(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: MenuItem(),
          ),
        ],
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Image.asset('assets/images/wedding_1.jpg')),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 0.72,
      crossAxisCount: 3,
      children: menuUtamaItem,
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    Key key,
    this.images,
    this.title,
    this.textcolor,
    this.rute,
  }) : super(key: key);
  final String images;
  final String title;
  final Color textcolor;
  final String rute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 105.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: RaisedButton(
              color: Color(0xffFFCDD2),
              shape: CircleBorder(),
              onPressed: () => Navigator.of(context).pushNamed(rute),
              child: Image.asset(images),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Montserrat'
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

List<Items> menuUtamaItem = [
  Items(
    images: 'assets/images/icon/wedding-dress.png',
    title: "Pakaian Wanita",
    textcolor: Colors.grey[600],
    rute: '/wanita',
  ),
  Items(
    images: 'assets/images/icon/wedding-arch.png',
    title: 'Venue & Decoration',
    textcolor: Colors.grey[600],
    rute: '/lokasi',
  ),
  Items(
    images: 'assets/images/icon/tuxedo.png',
    title: 'Pakaian Pria',
    textcolor: Colors.grey[600],
    rute: '/pria',
  ),
  Items(
    images: 'assets/images/icon/wedding-invitation-1.png',
    title: 'Undangan',
    textcolor: Colors.grey[600],
    rute: '/undangan',
  ),
  Items(
    images: 'assets/images/icon/music.png',
    title: 'Musik & Entertainment',
    textcolor: Colors.grey[600],
    rute: '/musik',
  ),
  Items(
    images: 'assets/images/icon/photo-camera.png',
    title: 'Dokumentasi',
    textcolor: Colors.grey[600],
    rute: '/dokumentasi',
  ),
];
