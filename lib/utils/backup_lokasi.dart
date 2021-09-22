// class DetailPage extends StatefulWidget {
//   DetailPage({
//     Key key,
//     this.detailItem,
//   }) : super(key: key);
//   DetailItem detailItem;

//   @override
//   _DetailPageState createState() => _DetailPageState(detailItem: detailItem);
// }

// class _DetailPageState extends State<DetailPage> {
//   _DetailPageState({this.detailItem});
//   final DetailItem detailItem;
//   final money = NumberFormat("#,##0", "en_US");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffFFCDD2),
//       appBar: AppBar(
//         backgroundColor: Colors.pink[200],
//         elevation: 1.0,
//         centerTitle: false,
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Wishlist(),
//                 ),
//               );
//             },
//             icon: Icon(Icons.card_giftcard),
//           )
//         ],
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             height: 240.0,
//             child: Hero(
//               tag: detailItem.gambar,
//               child: Material(
//                 type: MaterialType.transparency,
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(
//                       '${detailItem.gambar}',
//                       fit: BoxFit.cover,
//                       alignment: Alignment.center,
//                       width: double.infinity,
//                     ),
//                     BackdropFilter(
//                       filter: ImageFilter.blur(
//                         sigmaX: 5,
//                         sigmaY: 5,
//                       ),
//                       child: Container(
//                         height: 240.0,
//                         color: Colors.black.withOpacity(0.35),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 55),
//                       child: Center(
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               width: 79.5,
//                               height: 79.5,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                     image: NetworkImage('${detailItem.gambar}'),
//                                     alignment: Alignment.center,
//                                     fit: BoxFit.cover,
//                                   )),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 15.0),
//                               child: Material(
//                                 type: MaterialType.transparency,
//                                 child: Text(
//                                   '${detailItem.nama}',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14.0,
//                                       fontFamily: 'Montserrat'),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10.0),
//                               child: Material(
//                                 type: MaterialType.transparency,
//                                 child: Text(
//                                   '${detailItem.lokasi}',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14.0,
//                                       fontFamily: "Montserrat"),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//           Text(
//             'HARGA',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 15.0,
//               fontFamily: 'Montserrat',
//             ),
//           ),
//           Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text(
//                   'Rp.' + money.format(int.parse('${detailItem.harga}')) + '/hari',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 11.5, fontFamily: 'Montserrat'),
//                 ),
//               ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//           Text(
//                 'KEGIATAN APA YANG COCOK DILAKUKAN DI VENUE TERSEBUT ?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: Text(
//               '${detailItem.info_1}',
//               style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//           Text(
//                 'PENGATURAN APA YANG DITAWARKAN VENUE ANDA ?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: Text(
//               '${detailItem.info_2}',
//               style: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 11.5,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//           Text(
//                 'MOHON JELASKAN DENGAN LEBIH DETAIL TENTANG VENUE YANG ANDA MILIKI ?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: Text(
//               '${detailItem.info_3}',
//               style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//           Text(
//                 'APA SAJA VENUE YANG ANDA TAWARKAN?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: Text(
//               '${detailItem.info_4}',
//               style: TextStyle(fontFamily: 'Montserrat', fontSize: 11.5),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//           Text(
//                 'APA SAJA JENIS HIDANGAN SPESIALISASI VENUE ANDA?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//             Padding(
//             padding: const EdgeInsets.only(
//                 top: 20, left: 15.0, right: 15.0, bottom: 15.0),
//             child: Divider(color: Color(0xff000000)),
//           ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text(
//                   '${detailItem.info_5}',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat', fontSize: 11.5),
//                   textAlign: TextAlign.center,
//                 ),
//               ),

              
              
          
//           Text(
//                 'APAKAH YANG MEMBUAT LAYANAN ANDA UNIK?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
              

//           Padding(
//               padding: const EdgeInsets.only(
//                   top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
//               child: AddtoCart(
//                 detailItem: detailItem,
//               ))
//         ],
//       ),
//     );

//   }
// }