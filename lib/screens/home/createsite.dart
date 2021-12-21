import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SiteReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sites"),),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Site").snapshots(),
        builder: (context, snapshot){
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot site = snapshot.data.documents[index];
                return ListTile(
                title: Text(site['siteID']),
                //subtitle: Text(site['latitude']),
                );
              },
          );
        },
      ),
    );
  }
}
