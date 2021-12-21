import 'package:dia_app/screens/home/TestUser.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/models/antenna.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SiteNew.dart';
import 'antenna_details.dart';


class SubmitAntenna extends StatelessWidget {
  final AntennaModel antenna;
  final String doc;
  SubmitAntenna(this.doc,{Key key, @required this.antenna}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(doc),
        ),
        body: new Container(
          decoration: new BoxDecoration(color: Colors.pink[50]),
          child: new Center(
              child: MergeSemantics(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Material(
                              elevation: 24.0,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Antenna Details"),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    SizedBox(height: 10.0,),
                                    Text(
                                        "antennaID: ${antenna.antennaID}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "Twist: ${antenna.Twist}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "Azimuth: ${antenna.Azimuth}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "Mechanical Tilt: ${antenna.Mechanical_Tilt}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "height: ${antenna.height}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "height: ${antenna.height}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "siteid ${doc}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "antennafile ${antenna.antennafile}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text(
                                        "sectors ${antenna.sectors}"
                                    ),
                                    SizedBox(height: 30.0,),
                                    SizedBox(
                                      width: double.infinity,
                                      // height: double.infinity,
                                      child: new RaisedButton(
                                        color: Colors.deepPurpleAccent,
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Raleway',
                                            fontSize: 22.0,
                                          ),
                                        ),
                                        onPressed: () async{
                                          await Firestore.instance.collection('antenna').add(
                                              {

                                                'siteid': doc,
                                                'antennaid': antenna.antennaID,
                                                'twist': antenna.Twist,
                                                'azimuth': antenna.Azimuth,
                                                'mechanicaltilt': antenna.Mechanical_Tilt,
                                                'Height': antenna.height,
                                                'antennafile': antenna.antennafile,
                                                'sectors': antenna.sectors,


                                              }

                                          );
                                          //       MaterialPageRoute(
                                          // builder: (context) => AllRoutes(doc)
                                          //     );
                                          //2nd method
                                          //       Navigator.pushReplacement(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //           //settings: RouteSettings(name: "Foo"),
                                          //           builder: (context) => AllRoutes(doc),
                                          //         ),
                                          //       );
                                          //
                                          //       Navigator.popUntil(context, ModalRoute.withName("doc"));
                                          Navigator.pop(context);
                                          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Site(doc)));

                                          // Navigator.of(context).popUntil((route) => route.isFirst);
                                        },
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        )
    );
  }
}
