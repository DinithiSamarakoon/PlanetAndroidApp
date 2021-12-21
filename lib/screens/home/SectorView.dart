import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/screens/home/site.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dia_app/models/sector.dart';
class SectorView extends StatefulWidget {
  final List<Sector> sectors;

  final bool isMultiSelection;

  const SectorView({
    Key key,
    this.isMultiSelection = false,
    this.sectors = const [],
  }) : super(key: key);

  @override
  _SectorViewState createState() => _SectorViewState();
}


class _SectorViewState extends State<SectorView> {
  String text = '';
  List<Sector> selectedSectors = [];

  get sector => null;
 
  @override
  Widget build(BuildContext context) {
   // final provider = Provider.of<SectorProvider>(context);
    //final allSectors = provider.sectors;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Selected Sector'),
    //   ),
    //   body: ListView(
    //
    //   return SectorPage(
    //
    //
    //   )
    //   ),
    // )
    return SectorPage(
      sector: sector,
      isSelected: false,
      onSelectedSector: (sector) {},
    );

  }
}
