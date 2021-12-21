import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

import 'datacontroller.dart';


class SectorAddingPage extends StatefulWidget {
  @override
  _SectorAddingPageState createState() => _SectorAddingPageState();
}

class _SectorAddingPageState extends State<SectorAddingPage> {
  // final QuerySnapshot result = await Firestore.instance.collection('Sectors').getDocuments();
  // final List<DocumentSnapshot> documents = result.documents;
  //
  // List<String> myListString = [];
  //
  // documents.forEach((snapshot) {
  // myListString.add(snapshot.documentID)
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Sector Details to Add"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Select sector Details",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            DropDownField(
              controller: sectorsSelected,
              hintText: "Select sectors",
              enabled: true,
              itemsVisibleInDropdown: 5,
              items:sectors,
              onValueChanged: (value){
                setState(() {
                  selectSector= value;
                });
              },
            ),
            SizedBox(height: 40.0),
            Text("Select sector Details",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            DropDownField(
              controller: sectorsDataSelected,
              hintText: "Select sectors",
              enabled: true,
              itemsVisibleInDropdown: 5,
              items:sectorsList,
              onValueChanged: (value){
                setState(() {
                  selectSector= value;
                });
              },
            ),
            SizedBox(height: 270.0),
             FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllSites()),
                );
              },
              child: const Icon(Icons.navigation),
              backgroundColor: Colors.pink,
            ),
          ],
        ),

      ),


    );
  }
}
getRoutes() async {
  final data = await Firestore.instance.collection("Sectors").getDocuments();
  List routeList = List();
  for(int i = 0; i < data.documents.length; i++) {
    routeList.add(data.documents[i]);
    List<String> locations = data.documents.map((element) => element["siteid"]).toList();
    print(locations);
    return routeList;
  }
  // routes = routeList;
  // locations = data.docs.map((element) => element["locationName"]).toString().toList();
  // print(locations);
  // setState(() {});
}
String selectSector= "";
final sectorsSelected = TextEditingController();
final sectorsDataSelected = TextEditingController();

List<String> sectors= [
  "Colombo",
  "Gampaha",
  "Nuwara",
  "Jaffna",
  "New York",
  "Anuradhapura",
  "Perth",
  "Negombo",
  "Katunayake",
];

List<String> sectorsList= [
  "Col",
  "Gam",
  "Nura",
  "Jafa",
  "Newk",
  "Anurra",
  "Peth",
  "Nebo",
  "Katunke",
];
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class SectorAddingPage extends StatefulWidget {
//   @override
//   _DropdownButtonFormFieldExampleState createState() =>
//       _DropdownButtonFormFieldExampleState();
// }
//
// class _DropdownButtonFormFieldExampleState
//     extends State<SectorAddingPage> {
//   final updateFormKey = GlobalKey<FormState>();
//   DocumentSnapshot currentCategory;
//   TextEditingController categoryController = new TextEditingController();
//   String categoryname;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Dropdown Button'),),
//       body: Container(
//         child: Form(
//           key: updateFormKey,
//           child: Container(
//             padding: EdgeInsets.all(8.0),
//             child: ListView(
//               children: <Widget>[
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     new StreamBuilder<QuerySnapshot>(
//                         stream: Firestore.instance
//                             .collection('Sectors')
//                             .snapshots(),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.hasError) {
//                             print(snapshot.error);
//                           } else {
//                             if (!snapshot.hasData) {
//                               return Text('Loading...');
//                             }
//
//                             currentCategory = snapshot.data.documents[0];
//                             return Container(
//                               padding: EdgeInsets.all(16.0),
//                               decoration: new BoxDecoration(
//                                 color: Colors.grey[200],
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(4.0),
//                                   topRight: Radius.circular(4.0),
//                                 ),
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child:
//                                 new DropdownButtonFormField<DocumentSnapshot>(
//                                    value: currentCategory,
//
//                                   // value: currentCategory,
//
//                                     onChanged: (DocumentSnapshot newValue) {
//                                       setState(() {
//                                         currentCategory = newValue;
//                                       });
//                                       print(currentCategory.data['siteid']);
//                                     },
//                                     validator: (currentCategory) {
//                                       if (currentCategory == null) {
//                                         return 'Category Not Selected';
//                                       }
//                                     },
//                                     onSaved: (DocumentSnapshot newValue) {
//                               setState(() {
//                               currentCategory = newValue;
//                               });
//                               print(currentCategory.data);
//                               },
//                                 hint: Text('Select Category'),
//                                 items: snapshot.data.documents
//                                     .map((DocumentSnapshot document) {
//                                   return new DropdownMenuItem<DocumentSnapshot>(
//                                       value: document,
//                                       child: new Container(
//                                         decoration: new BoxDecoration(
//                                             borderRadius:
//                                             new BorderRadius.circular(5.0)),
//                                         height: 100.0,
//                                         padding: EdgeInsets.fromLTRB(
//                                             10.0, 2.0, 10.0, 0.0),
//                                         //color: primaryColor,
//                                         child: new Text(
//                                           document.data['siteid'],
//                                         ),
//                                       ));
//                                 }).toList(),
//                               ),
//                             ),
//                           );
//                         }
//                         }),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                     ),
//                     TextFormField(
//                       controller: categoryController,
//                       decoration: InputDecoration(
//                           labelText: 'Category Name', filled: true),
//                       validator: (input) {
//                         if (input.isEmpty) {
//                           return 'Category name can not be empty';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (input) {
//                         categoryname = input;
//                       },
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                     )
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Container(),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }