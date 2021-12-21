import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'SiteNew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SiteOne{
   String siteID;
  final num latitude;
  final num longitude;

  SiteOne({
    this.siteID,
    this.latitude,
    this.longitude,
  });

  SiteOne.fromSnapshot(DocumentSnapshot snapshot):
       siteID = snapshot['siteID'],
        latitude= snapshot['latitude'],
   longitude= snapshot['longitude'];
  //Map<String, dynamic>

  // factory Site.fromDocumen(DocumentSnapshot doc){
  //   return Site(
  //       siteID: doc['siteId'],
  //       latitude: doc['latitude'],
  //       longitude: doc['longitude']
  //   );
  // }

}



// Widget build(BuildContext context) {
//   // getSites();
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.pink,
//       title: Text('All sites'),
//       actions: <Widget>[
//         IconButton(
//             icon: Icon(Icons.cancel),
//
//
//         )
//
//
//
//
//       ],
//     ),
//     body: Container(
//         padding: EdgeInsets.all(10),
//         child: StreamBuilder(
//           stream: Firestore.instance.collection("Site").snapshots(),
//           builder: (context, snapshot){
//             return ListView.builder(
//               itemCount: snapshot.data.documents.length,
//               itemBuilder: (context, index){
//                 DocumentSnapshot site = snapshot.data.documents[index];
//
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => Site(site['siteID'],site['latitude']),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     elevation: 10,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                       child: Text(
//                         site['siteID'],
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 );
//
//               },
//             );
//           },
//
//         )
//
//     ),
//   );
// }
