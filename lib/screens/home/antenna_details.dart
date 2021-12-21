import 'package:dia_app/screens/home/submit_antenna.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/models/antenna.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'AddSectors.dart';


class AddAntennaDetail extends StatefulWidget {
  final AntennaModel antenna;
  final String doc;
  AddAntennaDetail(this.doc,{Key key, @required this.antenna}) : super(key: key);

  @override
  _AddAntennaDetailState createState() => _AddAntennaDetailState();
}

class _AddAntennaDetailState extends State<AddAntennaDetail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _twistController= new TextEditingController();
    _twistController.text = widget.antenna.Twist;
    TextEditingController _azimuthController= new TextEditingController();
    _azimuthController.text = widget.antenna.Azimuth;
    TextEditingController _hController= new TextEditingController();
    _hController.text = widget.antenna.height;
    TextEditingController _aController= new TextEditingController();
    _aController.text = widget.antenna.Mechanical_Tilt;
    // TextEditingController _sController= new TextEditingController();
    // _sController.text = antenna.sectors;



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(widget.doc),
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
                                    child: Text("Add Antenna Details",  style: TextStyle(fontSize: 17.0,)),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(height: 30.0,),
                                        TextField(
                                          controller: _twistController,
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                            labelText: "Twist",
                                          ),

                                        ),


                                        SizedBox(height: 20.0,),
                                        TextField(
                                          controller: _azimuthController,
                                          decoration: InputDecoration(
                                            labelText: "Azimuth",
                                          ),
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                        SizedBox(height: 20.0,),
                                        TextField(
                                          controller: _hController,
                                          decoration: InputDecoration(
                                            labelText: "Height",
                                          ),
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                        SizedBox(height: 20.0,),
                                        TextField(
                                          controller: _aController,
                                          decoration: InputDecoration(
                                            labelText: "Mechanical Tilt",
                                          ),
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
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
                                                widget.antenna.Twist = _twistController.text;
                                                widget.antenna.Azimuth=_azimuthController.text;
                                                widget.antenna.Mechanical_Tilt= _aController.text;
                                                widget.antenna.height=_hController.text;
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => SubmitAntenna(widget.doc,antenna :widget.antenna)
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
