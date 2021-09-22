import 'package:flutter/material.dart';
import 'package:kekkon/main.dart';
import 'package:intl/intl.dart';
import 'package:kekkon/utils/cartmodel.dart';

//  Widget _buildItem(String item, Animation animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//         child: ListTile(
//           title: Text(
//             item,
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//     );
//   }

class Wishlist extends StatefulWidget {
  Wishlist({Key key, this.iitem}) : super(key: key);
  final CartItems iitem;
  int total;

  @override
  _WishlistState createState() => _WishlistState(iitem: iitem);
}

class _WishlistState extends State<Wishlist> {
  _WishlistState({this.iitem});
  final CartItems iitem;

  int total;

  final money = NumberFormat("#,##0", "en_US");

  DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    _hitungTotal();
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: pickedDate,
    );

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _hitungTotal() async {
    setState(() {
      total = 0;
      for (int i = 0; i < listCarts.length; i++) {
        CartItems items = listCarts[i];
        total += items.harga;
      }
    });
  }

  Future<bool> infoDialog() {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perhatian'),
          content: Text('Pemesanan minimal 3 bulan sebelum acara'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Future<bool> checkoutGagal() {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perhatian'),
          content: Text('Minimal 1 pesanan'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

   @override
  Future<bool> checkoutSuccess() {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perhatian'),
          content: Text('Checkout Sukses'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFCDD2),
        appBar: AppBar(
          title: Text(
            'Wishlist',
            style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
            textAlign: TextAlign.left,
          ),
          backgroundColor: Colors.pink[200],
          elevation: 1.0,
          centerTitle: true,
        ),
        body: Container(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            shrinkWrap: true,
            itemCount: listCarts.length,
            itemBuilder: (context, index) {
              final item = listCarts[index];

              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    listCarts.removeAt(index).id;
                    total = 0;
                    for (int i = 0; i < listCarts.length; i++) {
                      CartItems items = listCarts[i];
                      total += items.harga;
                    }
                  });

                  print(total.toString());
                },
                child: ListTile(
                  title: Text(
                    item.nama,
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  subtitle: Text(
                    item.lokasi,
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  leading: Container(
                    height: 75.0,
                    width: 75.0,
                    child: Image.network(
                      item.gambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing:
                      Text('Rp.' + money.format(int.parse('${item.harga}'))),
                ),
              );
              // ListTile(
              //   title: Text(item.nama, style: TextStyle(fontFamily: 'Montserrat'),),
              //   subtitle: Text('Rp.' + money.format(int.parse('${item.harga}'))),
              //   leading: Image.network(item.gambar),
              //   trailing: IconButton(
              //     icon: Icon(Icons.clear),
              //     onPressed: (){
              //       listCarts.removeWhere((item) => item.id == listCarts[index].id);
              //       // AnimatedListRemovedItemBuilder(context, animation){
              //       //   return Text('test');
              //       // }
              //     },
              //   ),
              // );
            },
          ),
        ),
        bottomNavigationBar: Container(
          height: 100.0,
          color: Colors.pink[200],
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text('Total Harga : '),
                // subtitle: Text('data'),
                subtitle: Text('Rp.'+money.format(int.parse(total.toString()))),
                // subtitle: Text(iitem.sum.toString()),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: 30.0,
                          child: ListTile(
                            title: Text(
                              'Tanggal : ${pickedDate.day}, ${pickedDate.month}, ${pickedDate.year}',
                              style: TextStyle(fontSize: 10.0),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_down),
                            onTap: _pickDate,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: MaterialButton(
                            color: Colors.grey[200],
                            onPressed: () {
                              if (listCarts.length == 0){
                                checkoutGagal();
                              }
                              
                              else if (pickedDate.month < (DateTime.now().month+3)){
                                infoDialog();
                              }
                              else{
                                checkoutSuccess();
                              }
                            },
                            child: Text('Check Out')),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
