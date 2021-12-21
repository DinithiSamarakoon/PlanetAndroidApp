import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'AddSectors.dart';
import 'EditAntenna.dart';
import 'ExampleTwo.dart';

class Antenna extends StatelessWidget {
  //antennaID -> documentID
  final String antennaID;
  final String doc;
  //final String latitude;
  //constructor
  Antenna(this.antennaID,this.doc);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Antenna Details'),
    ),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('antenna').document(antennaID).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //return new Text("Loading");
            return LinearProgressIndicator();
          }
          var userDocument = snapshot.data;
          //print(userDocument["antennaID"]);
          //new Text(userDocument["latitude"]);
          return
            new Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 7.0,
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(

                      height: 500.0,
                      padding: EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(icon:Icon(Icons.edit), color: Colors.pink, onPressed: () {

                                //print(v[index].documentID);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditAntennaDetail(antennaID,doc),

                                    //pass the parameters to SubCategoery class
                                  ),
                                );
                              },
                            ),
                            //right: 16.0 ,
                            Text(
                              'Details',
                              style: TextStyle(
                                  fontSize: 17.0
                              ),

                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 0.5,
                              width: double.infinity,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'You have selected antennaID :'+ userDocument['antennaid'].toString() ,

                              style: TextStyle(
                                  fontSize: 17.0
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: <Widget>[

                                Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                         "Azimuth: "+ userDocument['azimuth'].toString(),
                                             //"latitude",
                                          style: TextStyle(
                                              fontSize: 18.0
                                          ),

                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          //"      Longitude"+ userDocument["longitude"],
                                          "Mechanical Tilt: "+ userDocument['mechanicaltilt'].toString(),
                                          style: TextStyle(
                                              fontSize: 18.0
                                          ),

                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Twist: "+ userDocument['twist'].toString(),
                                          //"latitude",
                                          style: TextStyle(
                                              fontSize: 18.0
                                          ),

                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),

                                        Text(
                                          "Height: "+ userDocument['Height'].toString(),
                                          //"latitude",
                                          style: TextStyle(
                                              fontSize: 18.0
                                          ),

                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),

                                        Text(
                                          "Sectors: "+ userDocument['sector'].toString(),
                                          //"latitude",
                                          style: TextStyle(
                                              fontSize: 18.0
                                          ),

                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                    SizedBox()
                                  ],
                                )
                                // Text('Loading Please Wait....')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            );
        },
      ),
      floatingActionButton: FloatingActionButton(

          child:Icon(Icons.add,

            color: Colors.pink,),

          onPressed:(){
            Navigator.push(context, MaterialPageRoute(
              //builder: (context) => AddAntennaPage( widget.doc)
                builder: (context) => DropDownSelectors(doc, antennaID)
              //widget.doc
            ),);
          }
      ),
    );
  }


}


