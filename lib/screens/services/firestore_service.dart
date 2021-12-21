// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dia_app/models/antenna.dart';
// import 'package:dia_app/screens/home/allRouters.dart';
//
// class FirestoreService{
//   // FirestoreService(this.doc);
//   static final FirestoreService _firestoreService =
//   FirestoreService._internal();
//   Firestore _db = Firestore.instance;
//
//   FirestoreService._internal();
//
//   factory FirestoreService(){
//     return _firestoreService;
//   }
//
//   // Stream <List<Antenna>> getAntenna(){
//   //   return _db
//   //       .collection('TestSite')
//   //       .snapshots()
//   //       .map((snapshot)=> snapshot.documents.map((doc) => Antenna.fromMap(doc.data
//   //   ).toList(),
//   //   ));
//   // }
//
// Future<void> addAntenna(Antenna antenna){
//     return Firestore.instance.collection('TestSite')
//         .document(doc)
//         .collection('Antennas').add(antenna.toMap());
// }
// }