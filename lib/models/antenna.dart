import 'package:cloud_firestore/cloud_firestore.dart';

class AntennaModel{
   String Azimuth;
  String antennaID;
   String height;
   String Mechanical_Tilt;
   String Twist;
   String antennafile;
   //String[] sectors;
   // List sectors;
   String sectors;

   AntennaModel(
    this.antennaID,
    this.height,
    this.Azimuth,
    this.Mechanical_Tilt,
    this.Twist,
    this.antennafile,
     this.sectors,

);
//    public AntennaModel(String antennaID,String height, String Azimuth,String  Mechanical_Tilt,String Twist, String[] sectors) {
//    this.antennaID=antennaID;
//    this.height=height;
//    this.Azimuth=Azimuth;
//    this.Mechanical_Tilt=Mechanical_Tilt;
//    this.Twist=Twist;
//    this.antennafile=antennafile;
//
//    this.sectors = sectors;
//    }

}
































//this will return antenna fromMap
// Antenna.fromMap(Map<String, dynamic> data){
//   Azimuth = data['Azimuth'];
//   antennaID = data['antennaID'];
//   longitude = data['longitude'];
// }

// Map<String, dynamic> toMap(){
//   return{
//     "Azimuth": Azimuth,
//     "antennaID": antennaID,
//     // "height": height,
//     // "Twist": Twist
//   };
// }
// class Antenna{
//   String siteID;
//   num latitude;
//   num longitude;
//
//   //this will return antenna fromMap
//   Antenna.fromMap(Map<String, dynamic> data){
//     siteID = data['siteID'];
//     latitude = data['latitude'];
//     longitude = data['longitude'];
//   }
//
//   Map<String, dynamic> toMap(){
//     return{
//       "Azimuth":
//     }
//   }
// }