import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Sector extends StatelessWidget {
  final String sectorID;
  //final String doc;
  Sector(this.sectorID);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Sector Details'),
        ),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('Sectors').document(sectorID).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
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
                           // IconButton(icon:Icon(Icons.edit), color: Colors.pink, onPressed: () {

                              //print(v[index].documentID);
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         print(sectorID);
                              //         //EditAntennaDetail(antennaID,doc),
                              //
                              //     //pass the parameters to SubCategoery class
                              //   ),
                              // );
                            //},
                            //),
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
                              'You have selected :'+ userDocument['technology'] +'_('+userDocument['sectorid'].toString()+')' ,

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
                                          "Btsname: "+ userDocument['btsname'].toString(),
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
                                //Text('Loading Please Wait....')
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
  );
}


}



