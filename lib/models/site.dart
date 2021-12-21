import 'package:cloud_firestore/cloud_firestore.dart';

class Site{
  final String siteID;
  final num latitude;
  final num longitude;

  Site({
    this.siteID,
    this.latitude,
    this.longitude,
});

  factory Site.fromDocumen(DocumentSnapshot doc){
    return Site(
      siteID: doc['siteId'],
      latitude: doc['latitude'],
      longitude: doc['longitude']
    );
  }

}

