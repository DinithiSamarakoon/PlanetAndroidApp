
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/models/antenna.dart';
import 'package:dia_app/models/sector.dart';
// SectorPage
class SectorPage extends StatelessWidget {
  final Sector sector;
  final bool isSelected;
  final ValueChanged<Sector> onSelectedSector;


  const SectorPage({

    Key key,
    this.sector,
    this.onSelectedSector,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SectorProvider>(context);
    //final allSectors = provider.sectors;
    final db = Firestore.instance;
    final selectedColor = Theme
        .of(context)
        .primaryColor;
    final style = isSelected
        ? TextStyle(
      fontSize: 18,
      color: selectedColor,
      fontWeight: FontWeight.bold,
    )
        : TextStyle(fontSize: 18);


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Select Sector'),
        ),
        body: StreamBuilder(
            stream: db.collection('Sectors').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return Card(

                        elevation: 10.00,
                        margin: EdgeInsets.all(0.50),
                        child: ListTile(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) =>
                            //         Profile(
                            //             miaquery: snapshot.data.documents[
                            //             ])));
                          }
                          ,
                          leading: CircleAvatar(
                            backgroundColor:
                            Colors.blueGrey.shade800,
                          ),
                          title: Text(document['sectorid'] ),
                             // + " " + document['sectorid']),
                          subtitle: Text(document['siteid'])   ,
                             // + " " + document['sectorid']),
                        ),
                      );
                    }).toList(),
                  );
              }
            })
    );
  }
}