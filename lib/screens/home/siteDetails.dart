import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/screens/home/sitedetailsgetbackend.dart';
import 'package:dia_app/widgets/progress.dart';
import 'package:flutter/material.dart';

final usersRef= Firestore.instance.collection('TestSite');
class SiteDetails extends StatefulWidget {

  final doc;
  SiteDetails(this.doc);

  @override
  _SiteDetailsState createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetails> {
// @override
// void initState(){
//   // getSites();
//   getSiteById();
//   super.initState();
// }
// Widget build(BuildContext context) {
//   return new StreamBuilder(
//       stream: Firestore.instance.collection('TestSite').document(widget.doc).snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return new Text("Loading");
//         }
//         var userDocument = snapshot.data;
//         return new Text(userDocument["siteID"]);
//       }
//   );
// }


// getSiteById(){
//   final String id= widget.doc;
//   usersRef.document(id).get().then((DocumentSnapshot doc) async {
//     print(doc.data);
//     final snapShot = await Firestore.instance.collection('posts').document("id").get();
//
//     if (snapShot.exists){
//       //it exists
//       print(doc.data['latitude']);
//     }
//     else{
//       //not exists
//     }
//
//   });
// }
// getSites(){
//   usersRef.getDocuments().then((QuerySnapshot snapshot) {
//     snapshot.documents.forEach((DocumentSnapshot doc) {
//       print(doc.data);
//       print(doc.documentID);
//
//     });
//   });
// }
//   final snapShot = Firestore.instance.collection('posts').document("doc").get();
//   if (snapShot.exists){
//   //it exists
//   print(snapshot);
//   }
//   else{
//   not exists
//   }
//   DocumentReference qs =
//   Firestore.instance.collection('posts').document(varuId);
//   DocumentSnapshot snap = await qs.get();
//   print(snap.data == null ? 'notexists' : 'we have this doc')
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.doc),
      ),
      body: new StreamBuilder(
      stream: Firestore.instance.collection('Sites').document(widget.doc).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        var userDocument = snapshot.data;
        //new Text(userDocument["latitude"]);
        return
          new Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 7.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 300.0,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 17.0
                          ),

                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'You have selected :' + widget.doc,
                          style: TextStyle(
                              fontSize: 17.0
                          ),
                        ),
                        SizedBox(height: 45.0),
                        Row(
                          children: <Widget>[

                            Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Latitude "+ userDocument["latitude"].toString(),
                                      style: TextStyle(
                                          fontSize: 18.0
                                      ),

                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                     "      Longitude"+ userDocument["longitude"].toString(),
                                      style: TextStyle(
                                          fontSize: 18.0
                                      ),

                                    ),
                                  ],
                                ),
                                SizedBox()
                              ],
                            )
                            // Text('Loading Please Wait....')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
      },
                ),
    );
  }
}




















  // CollectionReference _fireStore = Firestore.instance.collection('TestSite');
  // void getUserData(String docID) {
  //   _fireStore.document(widget.doc).get().then((DocumentSnapshot snapshot) {
  //     // prints the document Map{}
  //     debugPrint(snapshot.data.toString());
  //   });
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //       appBar: AppBar(
  //       backgroundColor: Colors.pink,
  //       title: Text(widget.doc),
  //     ),
//  body:StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('TestSite').snapshots(),
//          //.document(widget.doc)
//     //.where('widget.doc', isEqualTo: 'siteID')
//
//
//  builder: (context, snapshot) {
//     if (snapshot.hasData) {
//     //var doc = snapshot.data.documents;
//       //String documentID= widget.doc;
//       return Column(
//       children: <Widget>[
//         Text(snapshot.data.documents[1]['siteID']),
//
//       ],
//     );
//       // new ListView(
//     //   children: snapshot.data.documents.map((DocumentSnapshot document) {
//     //     return new ListTile(
//     //       // title: new Text(document['siteID']),
//     //       // subtitle: new Text(document['latitude']),
//     //      // child: new Text(document['longitude']),
//     //     );
//     //   }).toList(),
//     // );
// }else{
//       return Center(child: CircularProgressIndicator());
//     }
//     }
//     ),
//     );
//   }
// }
//body: Container(
//           padding: EdgeInsets.all(10),
//
//           child: StreamBuilder(
//             stream: Firestore.instance.collection("antenna").snapshots(),
//             builder: (context, snapshot){
//               return ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (context, index){
//                   DocumentSnapshot antenna = snapshot.data.documents[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => Antenna(antenna['antennaID']),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       elevation: 10,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                         child: Text(
//                           antenna['antennaID'],
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },


  // bool reviewFlag= false;
  //
  // var reviews;
  //
  // @override
  // void initState(){
  //   super.initState();

  //   SiteServices().getLatestDetails('doc')
  //       .then((QuerySnapshot docs){
  //         if(docs.documents.isNotEmpty){
  //           reviewFlag=true;
  //          // print()
  //           //reviews=docs.documents.data;
  //         }
  //   });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         title: Text(widget.doc),
//       ),
//       body: new Center(
//           child:Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Material(
//               elevation: 7.0,
//               borderRadius: BorderRadius.circular(7.0),
//               child: Container(
//                 height: 300.0,
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Details',
//                       style: TextStyle(
//                         fontSize: 17.0
//                       ),
//
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                       height: 0.5,
//                       width: double.infinity,
//                       color: Colors.red,
//                     ),
//                     SizedBox(
//                     height: 15.0,
//                     ),
//                     Text(
//                       'You have selected :'+widget.doc,
//                       style: TextStyle(
//                           fontSize: 17.0
//                       ),
//                     ),
//                     SizedBox(height: 45.0),
//                     Row(
//                       children: <Widget>[
//                         reviewFlag ?
//                             Row(
//                               children: <Widget>[
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Container(
//                                       height: 50.0,
//                                       width: 50.0,
//                                     ),
//                                     SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     Text(
//                                       reviews['reviewer'],
//                                       style: TextStyle(
//                                         fontSize: 14.0
//                                       ),
//
//                                     ),
//
//                                   ],
//                                 ),
//                                 SizedBox()
//                               ],
//                             )
//                       :Text('Loading Please Wait....')
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//       ),
//
//     );
//   }
// }


// class SectorDetails extends StatefulWidget {
//   @override
//   _SectorDetailsState createState() => _SectorDetailsState();
// }
//
// class _SectorDetailsState extends State<SectorDetails> {
// double latitude,longitude;
//
// getSiteLatitude(latitude){
//   this.latitude= double.parse(latitude);
// }
// getSiteLongitude(longitude){
//   this.longitude=double.parse(longitude);
// }
// createData(){
//   print('created');
//   DocumentReference documentReference=
//       Firestore.instance.collection('Site').document();
//
//   //create Map
//   Map<String, dynamic> sites = {
//     //"siteID" : siteID,
//     "latutude": latitude,
//     "longitude": longitude,
//   };
//   documentReference.setData(sites).whenComplete((){
//     print("done");
//   });
//
// }
// readData(){
//   print('read');
//   DocumentReference documentReference=
//   Firestore.instance.collection('Site').document();
//
//   documentReference.get().then((datasnapshot){
//     print(datasnapshot.data["latitude"]);
//     print(datasnapshot.data["longitude"]);
//   });
// }
// updateData(){
//   print('update');
// }
// deleteData(){
//   print('deleted');
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         title: Text('Details of ..selected siteid'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: "Latitude",
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.red[200],
//                   width: 2.0
//                   )
//                 )
//               ),
//            onChanged: (String latitude){
//               getSiteLatitude(latitude);
//            },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   labelText: "longitude",
//                   fillColor: Colors.white,
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red[200],
//                           width: 2.0
//                       )
//                   )
//               ),
//               onChanged: (String longitude){
//                 getSiteLongitude(longitude);
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget> [
//               RaisedButton(
//                   color: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                     child:Text('Create'),
//                     textColor: Colors.white,
//                       onPressed: (){
//                     createData();
//                       },
//                   ),
//               RaisedButton(
//                 color: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 child:Text('Read'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   readData();
//                 },
//               ),
//               RaisedButton(
//                 color: Colors.orange,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 child:Text('Update'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   updateData();
//                 },
//               ),
//               RaisedButton(
//                 color: Colors.red,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 child:Text('Delete'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   deleteData();
//                 },
//               ),
//
//
//
//             ],
//
//           )
//         ],
//       ),
//
//     );
//   }
// }