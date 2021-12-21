import 'package:dia_app/screens/home/sector.dart';
import 'package:dia_app/screens/home/sectorNew.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AddSector.dart';
import 'add_Sector.dart';

class AllSectors extends StatefulWidget {
  final doc;
  AllSectors(this.doc);
  @override
  _AllSectorsState createState() => _AllSectorsState();
}

class _AllSectorsState extends State<AllSectors> {
  bool isSearching =false;
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // getSites();
    final newSector = new SectorModel(null,null,null,null,null);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: !isSearching ? Text('Sectors')
              : TextField(
            // controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(Icons.search,
                  color: Colors.white,),
                hintText: "Search Sectors here",
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
        body: StreamBuilder(
          stream: db
              .collection('Sectors')
              .where("siteid", isEqualTo:widget.doc)
              .snapshots(),
          // db
          //     .collection('TestSite')
          //     .document(widget.doc)
          //     .collection('Sectors')
          //     .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var v = snapshot.data.documents;
              return new ListView.builder(
                  itemCount: v.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(v[index].documentID);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                  Sector(v[index].documentID),
                            //pass the parameters to SubCategoery class
                          ),
                        );
                      },

                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          child: Text(
                            //v[index].documentID,
                            //sectorid
                              v[index].data["technology"]+
                                  " _(" +  v[index].data["sectorid"].toString()+ ")" ,
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

        ),
      floatingActionButton: FloatingActionButton(

          child:Icon(Icons.add,   color: Colors.pink,),

          onPressed:(){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddDSector( widget.doc, sector :newSector)
                //builder: (context) => AddSectorPage( widget.doc, sector :newSector)
              //widget.doc
            ),);
          }
      ),

    );
  }
}












//   bool isSearching =false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//
//         title: !isSearching ? Text('Sectors')
//             : TextField(
//           // controller: _searchController,
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//               icon: Icon(Icons.search,
//                 color: Colors.white,),
//               hintText: "Search sites here",
//               hintStyle: TextStyle(color: Colors.white)
//           ),
//         ),
//         actions: <Widget>[
//           isSearching ?
//           IconButton(
//               icon: Icon(Icons.cancel),
//               onPressed: (){
//                 setState(() {
//                   this.isSearching = false;
//                 });
//
//               }
//           )
//               : IconButton(
//               icon: Icon(Icons.search),
//               onPressed: (){
//                 setState(() {
//                   this.isSearching = true;
//                 });
//
//               }
//           )
//         ],
//       ),
//       body: Container(
//           padding: EdgeInsets.all(10),
//           // child: ListView.builder(
//           //   itemCount: _resultsList.length,
//           //     itemBuilder: (BuildContext context, int index) {
//           //       DocumentSnapshot site = _resultsList[index];
//           child: StreamBuilder(
//             stream: Firestore.instance.collection("sector").snapshots(),
//             builder: (context, snapshot){
//               return ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (context, index){
//                   DocumentSnapshot sector = snapshot.data.documents[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => Sector(sector['sectorID']),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       elevation: 10,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                         child: Text(
//                           sector['sectorID'],
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//
//           )
//
//       ),
//     );
//   }
// }


