import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  final doc;
  Location(this.doc);
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  //
  // GoogleMapController mapController;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.doc),
        backgroundColor: Colors.pink,
      ),
    //   body: Column(
    //       children: <Widget>[
    //   Container(
    //   height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   child: GoogleMap(
    //     onMapCreated: (GoogleMapController controller) {
    //       mapController = controller;
    //     },
    //   ),
    //   )
    //   ],
    // ),
    // floatingActionButton: FloatingActionButton(onPressed: () {
    // mapController.animateCamera(
    // CameraUpdate.newCameraPosition(
    // CameraPosition(
    // target: LatLng(37.4219999, -122.0862462), zoom: 20.0),
    // ),
    // );
    // }),
    );
  }


}
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class Location extends StatefulWidget {
//   final doc;
//   Location(this.doc);
//   @override
//   _LocationState createState() => _LocationState();
// }
//
// class _LocationState extends State<Location> {
//   bool mapToggle = false;
//   var currentLocation;
//
//   GoogleMapController mapController;
//
//   void initState(){
//     super.initState();
//     Geolocator().getCurrentPosition().then((currloc){
//       setState(() {
//         currentLocation= currloc;
//         mapToggle= true;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title:Text('Location'),
//           backgroundColor: Colors.pink,
//         ),
//         body: Column(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Container(
//                     height: MediaQuery.of(context).size.height - 80.0,
//                     width: double.infinity,
//                     child: mapToggle
//                         ? GoogleMap(
//                       onMapCreated: onMapCreated,
//                       options: GoogleMapOptions(
//                           cameraPosition: CameraPosition(
//                               target: LatLng(currentLocation.latitude, currentLocation.longitude),
//                               zoom: 10.0
//                           )
//                       ),
//                     )
//                         : Center(child:
//                     Text('Loading... Please wait...',
//                       style: TextStyle(
//                           fontSize: 20.0
//                       ),))
//
//                 )
//               ],
//             )
//           ],
//         )
//     );
//   }
//   void onMapCreated(controller){
//     setState((){
//       mapController = controller;
//     });
//   }
//
// }
//
