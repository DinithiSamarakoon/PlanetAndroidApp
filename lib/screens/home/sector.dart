import 'package:cloud_firestore/cloud_firestore.dart';

class SectorModel {
  String technology;
  String bandname;
  String btsname;
  String sectorid;
  String siteid;


  SectorModel(
      this.technology,
      this.bandname,
      this.btsname,
      this.sectorid,
      this.siteid,

      );

}