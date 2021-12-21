import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubCategoery extends StatefulWidget {
  final doc;
  SubCategoery(this.doc);

  @override
  _SubCategoryClassState createState() => _SubCategoryClassState();
}

class _SubCategoryClassState extends State<SubCategoery> {
  final db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doc,),
        centerTitle: true,
      ),
      body:  StreamBuilder(
        stream: db
            .collection('Users')
            .document(widget.doc)
            .collection('TestSubCollection')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var doc = snapshot.data.documents;
            return new ListView.builder(
                itemCount: doc.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Text(doc[index].data['Course']),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(doc[index].data['other']),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}