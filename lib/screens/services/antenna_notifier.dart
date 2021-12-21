// import 'dart:collection';
//
// import 'package:dia_app/models/antenna.dart';
// import 'package:flutter/cupertino.dart';
//
// class AntennaNotifier with ChangeNotifier{
//   List<Antenna> _antennaList = [];
//   Antenna _currentAntenna;
//
//   UnmodifiableListView<Antenna> get antennaList => UnmodifiableListView(_antennaList);
//
//   Antenna get currentAntenna => _currentAntenna;
//
//   set antennaList(List<Antenna> antennaList){
//     _antennaList = antennaList;
//     notifyListeners();
//   }
//   set currentAntenna(Antenna antenna){
//     _currentAntenna = antenna;
//     notifyListeners();
//   }
// }