import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kekkon/pages/wishlist.dart';
import 'package:kekkon/utils/cartmodel.dart';
import 'package:kekkon/main.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:link/link.dart';
import 'package:url_launcher/url_launcher.dart';

class AddtoCart extends StatefulWidget {
  // DetailItem detailItem = DetailItem(nama: "TEST");
  final DetailItem detailItem;

  AddtoCart({
    Key key,
    this.detailItem,
  }) : super(key: key);

  @override
  _AddtoCartState createState() => _AddtoCartState(detailItem: detailItem);
}

@override
void addCart(DetailItem detailItem) {
  CartItems items = CartItems(
      id: detailItem.id,
      nama: detailItem.nama,
      gambar: detailItem.gambar,
      lokasi: detailItem.lokasi,
      harga: detailItem.harga,
      sum: 0);
  listCarts.add(items);
  // listCarts.forEach((items)
  // {
  //   items.sum += items.harga ;

  //   if(listCarts.length==0){
  //     return Text('0');
  //   }

  //   return Text(items.sum.toString());

  // });

  for (int i = 0; i < listCarts.length; i++) {
    items.sum += items.harga;
  }

  print(items.sum.toString());
}

class _AddtoCartState extends State<AddtoCart> {
  final DetailItem detailItem;

  _AddtoCartState({
    this.detailItem,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      onPressed: () {
        addCart(detailItem);
        final snackbar = SnackBar(
          content: Text('Menambahkan ${detailItem.nama} ke Wishlist'),
        );

        Scaffold.of(context).showSnackBar(snackbar);

        // listCarts.add(cartItems);
        // print(listCarts.length);

        // for(int i=0;i<listCarts.length;i++){
        //   // print(listCarts[i];
        //   var data = listCarts[i];
        //   print(data.nama);
        // }
      },
      child: Text(
        'Add to Wishlist',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      color: Colors.grey[200],
    );
  }
}

class DetailItem {
  String nama;
  int harga;
  String lokasi;
  String gambar;

  int sum;

  String gambar1;
  String gambar2;
  String gambar3;
  String gambar4;
  String gambar5;

  String id;
  String info_1;
  String info_2;
  String info_3;
  String info_4;
  String info_5;
  String info_6;
  String alamat;
  String email;
  String kontak;
  String web;
  int qty = 1;

  DetailItem(
      {this.nama,
      this.harga,
      this.lokasi,
      this.gambar,
      this.gambar1,
      this.gambar2,
      this.gambar3,
      this.gambar4,
      this.gambar5,
      this.id,
      this.info_1,
      this.info_2,
      this.info_3,
      this.info_4,
      this.info_5,
      this.info_6,
      this.alamat,
      this.email,
      this.kontak,
      this.web,
      this.qty});
}

class DetailPage extends StatefulWidget {
  DetailPage({
    Key key,
    this.detailItem,
  }) : super(key: key);
  DetailItem detailItem;

  @override
  _DetailPageState createState() => _DetailPageState(detailItem: detailItem);
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState({this.detailItem});
  final DetailItem detailItem;
  final money = NumberFormat("#,##0", "en_US");

  Future<void> _launchURL(DetailItem detailItem) async {
    String url = detailItem.web;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
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
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: detailItem.gambar,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      '${detailItem.gambar}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: 240.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 79.5,
                              height: 79.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('${detailItem.gambar}'),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.nama}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.lokasi}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: "Montserrat"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'GALLERY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              height: 220,
              items: [
                '${detailItem.gambar1}',
                '${detailItem.gambar2}',
                '${detailItem.gambar3}',
                '${detailItem.gambar4}',
                '${detailItem.gambar5}'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network('$i', fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'HARGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Rp.' + money.format(int.parse('${detailItem.harga}')) + '/hari',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'KEGIATAN APA YANG COCOK DILAKUKAN DI VENUE TERSEBUT ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_1}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'PENGATURAN APA YANG DITAWARKAN VENUE ANDA ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_2}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'MOHON JELASKAN DENGAN LEBIH DETAIL TENTANG VENUE YANG ANDA MILIKI ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_3}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SAJA VENUE YANG ANDA TAWARKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_4}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SAJA JENIS HIDANGAN SPESIALISASI VENUE ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_5}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'APAKAH YANG MEMBUAT LAYANAN ANDA UNIK?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'INFORMASI VENDOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Alamat : ' + '${detailItem.alamat}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Text(
                  'Web / Social media : ' + '${detailItem.web}',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _launchURL(detailItem);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Email : ' + '${detailItem.email}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Kontak : ' + '${detailItem.kontak}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: AddtoCart(
                detailItem: detailItem,
              ))
        ],
      ),
    );
  }
}

class DetailUndangan extends StatefulWidget {
  DetailUndangan({Key key, this.detailItem}) : super(key: key);
  DetailItem detailItem;

  @override
  _DetailUndanganState createState() =>
      _DetailUndanganState(detailItem: detailItem);
}

class _DetailUndanganState extends State<DetailUndangan> {
  _DetailUndanganState({this.detailItem});
  final DetailItem detailItem;
  final money = NumberFormat("#,##0", "en_US");

  Future<void> _launchURL(DetailItem detailItem) async {
    String url = detailItem.web;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
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
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: detailItem.gambar,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      '${detailItem.gambar}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: 240.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 79.5,
                              height: 79.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('${detailItem.gambar}'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.nama}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.lokasi}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: "Montserrat"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'GALLERY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              height: 220,
              items: [
                '${detailItem.gambar1}',
                '${detailItem.gambar2}',
                '${detailItem.gambar3}',
                '${detailItem.gambar4}',
                '${detailItem.gambar5}'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network('$i', fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'HARGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Rp.' + money.format(int.parse('${detailItem.harga}')) + '/paket',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'LAYANAN APA SAJA YANG TERMASUK DALAM PAKET ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_1}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APAKAH ANDA MENYEDIAKAN KATALOG ATAU PRODUK SESUAI PESANAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_2}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APAKAH ANDA MENYEDIAKAN LAYANAN PENGIRIMAN UNDANGAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_3}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA YANG MEMBUAT LAYANAN ANDA UNIK?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_4}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'INFORMASI VENDOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Alamat : ' + '${detailItem.alamat}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Text(
                  'Web / Social media : ' + '${detailItem.web}',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _launchURL(detailItem);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Email : ' + '${detailItem.email}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Kontak : ' + '${detailItem.kontak}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: AddtoCart(
                detailItem: detailItem,
              ))
        ],
      ),
    );
  }
}

class DetailGaun extends StatefulWidget {
  DetailGaun({Key key, this.detailItem}) : super(key: key);
  DetailItem detailItem;

  @override
  _DetailGaunState createState() => _DetailGaunState(detailItem: detailItem);
}

class _DetailGaunState extends State<DetailGaun> {
  _DetailGaunState({this.detailItem});
  final DetailItem detailItem;
  final money = NumberFormat("#,##0", "en_US");

  Future<void> _launchURL(DetailItem detailItem) async {
    String url = detailItem.web;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
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
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: detailItem.gambar,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      '${detailItem.gambar}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: 240.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 79.5,
                              height: 79.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('${detailItem.gambar}'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.nama}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.lokasi}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: "Montserrat"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'GALLERY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              height: 220,
              items: [
                '${detailItem.gambar1}',
                '${detailItem.gambar2}',
                '${detailItem.gambar3}',
                '${detailItem.gambar4}',
                '${detailItem.gambar5}'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network('$i', fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'HARGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Rp.' +
                  money.format(int.parse('${detailItem.harga}')) +
                  '/busana',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SAJA JENIS GAUN DAN PAKAIAN YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_1}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SPESIALIS ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_2}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'LAYANAN APA SAJA YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_3}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA GAYA GAUN SPESIALISASI ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_4}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'AKSESORIS APA YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_5}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APAKAH YANG MEMBUAT LAYANAN ANDA UNIK?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_6}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'INFORMASI VENDOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Alamat : ' + '${detailItem.alamat}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Text(
                  'Web / Social media : ' + '${detailItem.web}',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _launchURL(detailItem);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Email : ' + '${detailItem.email}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Kontak : ' + '${detailItem.kontak}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: AddtoCart(
                detailItem: detailItem,
              ))
        ],
      ),
    );
  }
}

class DetailJas extends StatefulWidget {
  DetailJas({Key key, this.detailItem}) : super(key: key);
  DetailItem detailItem;

  @override
  _DetailJasState createState() => _DetailJasState(detailItem: detailItem);
}

class _DetailJasState extends State<DetailJas> {
  _DetailJasState({this.detailItem});
  final DetailItem detailItem;
  final money = NumberFormat("#,##0", "en_US");

  Future<void> _launchURL(DetailItem detailItem) async {
    String url = detailItem.web;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
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
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: detailItem.gambar,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      '${detailItem.gambar}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: 240.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 79.5,
                              height: 79.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('${detailItem.gambar}'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.nama}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.lokasi}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: "Montserrat"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'GALLERY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              height: 220,
              items: [
                '${detailItem.gambar1}',
                '${detailItem.gambar2}',
                '${detailItem.gambar3}',
                '${detailItem.gambar4}',
                '${detailItem.gambar5}'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network('$i', fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'HARGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Rp.' +
                  money.format(int.parse('${detailItem.harga}')) +
                  '/busana',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SAJA JENIS PAKAIAN PRIA YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_1}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'LAYANAN APA SAJA YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_2}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA JENIS GAYA SPESIALISASI ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_3}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'AKSESORI APA YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_4}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA YANG MEMBUAT LAYANAN ANDA UNIK?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_5}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'INFORMASI VENDOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Alamat : ' + '${detailItem.alamat}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Text(
                  'Web / Social media : ' + '${detailItem.web}',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _launchURL(detailItem);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Email : ' + '${detailItem.email}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Kontak : ' + '${detailItem.kontak}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
            child: AddtoCart(
              detailItem: detailItem,
            ),
          )
        ],
      ),
    );
  }
}

class DetailDoku extends StatefulWidget {
  DetailDoku({Key key, this.detailItem}) : super(key: key);
  DetailItem detailItem;

  @override
  _DetailDokuState createState() => _DetailDokuState(detailItem: detailItem);
}

class _DetailDokuState extends State<DetailDoku> {
  _DetailDokuState({this.detailItem});
  final DetailItem detailItem;
  final money = NumberFormat("#,##0", "en_US");

  Future<void> _launchURL(DetailItem detailItem) async {
    String url = detailItem.web;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
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
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: detailItem.gambar,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      '${detailItem.gambar}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: 240.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 79.5,
                              height: 79.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('${detailItem.gambar}'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.nama}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.lokasi}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: "Montserrat"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'GALLERY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              height: 220,
              items: [
                '${detailItem.gambar1}',
                '${detailItem.gambar2}',
                '${detailItem.gambar3}',
                '${detailItem.gambar4}',
                '${detailItem.gambar5}'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network('$i', fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'HARGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Rp.' + money.format(int.parse('${detailItem.harga}')) + '/hari',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SAJA YANG TERMASUK DALAM PAKET PHOTOSHOOT ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_1}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'MENCANGKUP APA SAJA LAYANAN ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_2}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA GAYA FOTOGRAFI YANG BIASANYA ANDA TAWARKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_3}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA GAYA FOTOGRAFI ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_4}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA SPESIALISASI ANDA?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_5}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APAKAH YANG MEMBUAT LAYANAN ANDA UNIK?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_6}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'INFORMASI VENDOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Alamat : ' + '${detailItem.alamat}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Text(
                  'Web / Social media : ' + '${detailItem.web}',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _launchURL(detailItem);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Email : ' + '${detailItem.email}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Kontak : ' + '${detailItem.kontak}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
            child: AddtoCart(
              detailItem: detailItem,
            ),
          )
        ],
      ),
    );
  }
}

class DetailMusik extends StatefulWidget {
  DetailMusik({Key key, this.detailItem}) : super(key: key);
  DetailItem detailItem;

  @override
  _DetailMusikState createState() => _DetailMusikState(detailItem: detailItem);
}

class _DetailMusikState extends State<DetailMusik> {
  _DetailMusikState({this.detailItem});
  final DetailItem detailItem;
  final money = NumberFormat("#,##0", "en_US");

  Future<void> _launchURL(DetailItem detailItem) async {
    String url = detailItem.web;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
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
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: detailItem.gambar,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      '${detailItem.gambar}',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: 240.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 79.5,
                              height: 79.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('${detailItem.gambar}'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.nama}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${detailItem.lokasi}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontFamily: "Montserrat"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'GALLERY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              height: 220,
              items: [
                '${detailItem.gambar1}',
                '${detailItem.gambar2}',
                '${detailItem.gambar3}',
                '${detailItem.gambar4}',
                '${detailItem.gambar5}'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network('$i', fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'HARGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Rp.' + money.format(int.parse('${detailItem.harga}')) + '/2 Jam',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'LAYANAN APA YANG ANDA TAWARKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_1}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA ALIRAN MUSIK YANG ANDA TAWARKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_2}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA JENIS GRUP MUSIK YANG ANDA SEDIAKAN?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_3}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'APA YANG MEMBUAT LAYANAN ANDA UNIK?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${detailItem.info_4}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 15.0, right: 15.0, bottom: 15.0),
            child: Divider(color: Color(0xff000000)),
          ),
          Text(
            'INFORMASI VENDOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Alamat : ' + '${detailItem.alamat}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Text(
                  'Web / Social media : ' + '${detailItem.web}',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _launchURL(detailItem);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Email : ' + '${detailItem.email}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SelectableText(
              'Kontak : ' + '${detailItem.kontak}',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: AddtoCart(
                detailItem: detailItem,
              ))
        ],
      ),
    );
  }
}
