import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/screens/home/siteCard.dart';

import 'SiteNew.dart';

import 'package:dia_app/screens/home/SiteNew.dart';
//import 'package:dia_app/screens/home/siteCard.dart';

//final siteRef = Firestore.instance.collection('Site');

class AllSites extends StatefulWidget {

  @override
  _AllSitesState createState() => _AllSitesState();
}

class _AllSitesState extends State<AllSites> {
  bool isSearching =false;
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
   // getSites();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching ? Text('All sites')
            : TextField(
         // controller: _searchController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            icon: Icon(Icons.search,
              color: Colors.white,),
            hintText: "Search sites here",
            hintStyle: TextStyle(color: Colors.white)
          ),
        ),
        actions: <Widget>[
          isSearching ?
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: (){
                setState(() {
                  this.isSearching = false;
                });

              }
          )
          : IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  this.isSearching = true;
                });

              }
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
    stream: db.collection('Sites').snapshots(),
          //TestSite
          //Sites
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    var doc = snapshot.data.documents;
    return new ListView.builder(
    itemCount: doc.length,
    itemBuilder: (context, index) {
                      return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Site(doc[index].documentID)
                                    //pass the parameters to SubCategoery class
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                  child: Text(
                                    doc[index].documentID,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            );
    });
    } else {
      return LinearProgressIndicator();
    }
    },

          )


    );
  }
}





//Future<QuerySnapshot> searchResultsFuture;
//Future<List> sites;
//
// Future<List> getSites() async {
//   QuerySnapshot querySnapshot = await Firestore.instance.collection("Site")
//       .getDocuments();
//   //var site = querySnapshot.documents;
//   setState(() {
//     return querySnapshot.documents as Future<List>;
//   });
// }
// Future getSites() async {
//   QuerySnapshot querySnapshot = await Firestore.instance.collection("Site")
//       .getDocuments();
//   print(querySnapshot.documents);
//    return querySnapshot.documents;
//var site = querySnapshot.documents;
// setState(() {
//   return querySnapshot.documents as Future<List>;
// });
//}
// @override
// void initState() {
//   //sites = getSites();
//   //print(sites);
//   super.initState();
// }


























// ListView(children: <Widget>[
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(builder: (context) => Site("JA0001"),
        //         ),
        //       );
        //     },
        //     child: Card(
        //       elevation: 10,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //         child: Text(
        //           'JA0001',
        //           style: TextStyle(fontSize: 18),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],)


//
// class Seacrch extends StatefulWidget {
//   @override
//   _SeacrchState createState() => _SeacrchState();
// }
//
// class _SeacrchState extends State<Seacrch> {
//   final TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton:
//       FloatingActionButton(
//           child: Icon(Icons.clear), onPressed: () {}),
//       backgroundColor: Colors.brown[50],
//       appBar: AppBar(
//         actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
//         title: TextField(
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//               hintText: 'Search Sites',
//               hintStyle: TextStyle(color: Colors.white)
//           ),
//           controller: searchController,
//         ),
//         backgroundColor: Colors.grey,
//       ),
//     );
//   }
//   }
// }
