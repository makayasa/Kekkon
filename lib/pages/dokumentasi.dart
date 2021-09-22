import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kekkon/utils/detail.dart';

import 'wishlist.dart';

class Dokumentasi extends StatelessWidget {
  const Dokumentasi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCDD2),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        title: Center(
          child: Text(
            'Dokumentasi',
            style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
          ),
        ),
        backgroundColor: Colors.pink[200],
        elevation: 1.0,
        centerTitle: false,
      ),
      body: Fotografer(),
    );
  }
}

class Fotografer extends StatelessWidget {
  const Fotografer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('dokumentasi')
          .orderBy('nama', descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return GridView.builder(
              itemCount: snapshot.data.documents.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return Container(
                  padding: const EdgeInsets.all(18.0),
                  height: 150,
                  width: 240,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: ds['gambar'],
                          child: Material(
                            child: InkWell(
                              onTap: () {
                                final DetailItem detailItem = DetailItem(
                                  nama: ds['nama'],
                                  gambar: ds['gambar'],
                                  gambar1: ds['gambar_1'],
                                  gambar2: ds['gambar_2'],
                                  gambar3: ds['gambar_3'],
                                  gambar4: ds['gambar_4'],
                                  gambar5: ds['gambar_5'],
                                  harga: ds['harga'],
                                  lokasi: ds['lokasi'],
                                  id: ds['id'],
                                  info_1: ds['info_1'],
                                  info_2: ds['info_2'],
                                  info_3: ds['info_3'],
                                  info_4: ds['info_4'],
                                  info_5: ds['info_5'],
                                  info_6: ds['info_6'],
                                  alamat: ds['alamat'],
                                  email: ds['email'],
                                  kontak: ds['kontak'],
                                  web: ds['web'],
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailDoku(
                                      detailItem: detailItem,
                                    ),
                                  ),
                                );
                              },
                              child: Image.network(ds['gambar'],
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: double.infinity,
                                  alignment: Alignment.center, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            ds['nama'],
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
