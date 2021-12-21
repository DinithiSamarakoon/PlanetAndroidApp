import 'package:dia_app/screens/home/sector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ViewSectorDetails.dart';
class AddDSector extends StatelessWidget {
  final SectorModel sector;
  final String doc;
  AddDSector(this.doc, {Key key, @required this.sector}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    TextEditingController _sectoridController= new TextEditingController();
    _sectoridController.text = sector.sectorid;
    TextEditingController _technologyController= new TextEditingController();
    _technologyController.text = sector.technology;
    TextEditingController _bandnameController= new TextEditingController();
    _bandnameController.text = sector.bandname;
    TextEditingController _bstnameController= new TextEditingController();
    _bstnameController.text = sector.bandname;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(doc),
    ),
        body: new Container(
          decoration: new BoxDecoration(color: Colors.pink[50]),
    child: SingleChildScrollView(
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
                                child: Text("Add Sector Details",  style: TextStyle(fontSize: 17.0,)),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    SizedBox(height: 30.0,),
                                    TextField(
                                      controller: _sectoridController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        labelText: "SectorID",
                                      ),

                                    ),

                                    SizedBox(height: 20.0,),
                                    TextField(
                                      controller: _bandnameController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        labelText: "Bandname",
                                        hintText: "L900",
                                      ),

                                    ),
                                    SizedBox(height: 20.0,),
                                    TextField(
                                      controller: _bstnameController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        labelText: "BstName",
                                        hintText: "3G",
                                      ),

                                    ),
                                    SizedBox(height: 20.0,),
                                    TextField(
                                      controller: _technologyController,
                                      decoration: InputDecoration(
                                        labelText: "Technology",
                                      ),
                                      autofocus: true,
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
                                          onPressed: (){
                                            sector.sectorid = _sectoridController.text;
                                            sector.bandname = _bandnameController.text;
                                            sector.technology =_technologyController.text;
                                            sector.btsname =_bstnameController.text;

                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => ViewSectorDetails(doc, sector :sector)
                                              //widget.doc
                                            ),);
                                          }
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
        )
    );

  }
}
