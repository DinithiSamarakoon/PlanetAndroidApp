import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/screens/home/sector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SiteNew.dart';
import 'allRouters.dart';
class ViewSectorDetails extends StatelessWidget {
  final SectorModel sector;
  final String doc;
  ViewSectorDetails(this.doc, {Key key, @required this.sector}) : super(key: key);
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
                                child: Text("Sector Details"),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    SizedBox(height: 40.0,),
                                    Text(
                                        "SectorID: ${sector.sectorid}"
                                    ),
                                    SizedBox(height: 40.0,),
                                    Text(
                                      "Band Name: ${sector.bandname}"
                                    ),
                                    SizedBox(height: 40.0,),
                                    Text(
                                        "Bst Name: ${sector.btsname}"
                                    ),
                                    SizedBox(height: 40.0,),
                                    Text(
                                        "Technology ${sector.technology}"
                                    ),
                                    SizedBox(height: 40.0,),
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
                                          await Firestore.instance.collection('Sectors').add(
                                              {

                                                'siteid': doc,
                                                'sectorid':sector.sectorid,
                                                'bandname': sector.bandname,
                                                'technology': sector.technology,
                                                'btsname': sector.btsname,

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
