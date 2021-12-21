import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/screens/home/SubCat.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Collection Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('Users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doc = snapshot.data.documents;
              return new ListView.builder(
                  itemCount: doc.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                         // var d=doc[index].documentID;
                          //print(doc[index].documentID);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubCategoery(doc[index].documentID)
                            //pass the parameters to SubCategoery class
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Text(doc[index].documentID),
                              //Text(doc[index].data['siteID']),
                              SizedBox(
                                height: 10.0,
                              ),
                              //Text(doc[index].data['phone']),
                            ],
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
      ),
    );
  }
}