import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/models/antenna.dart';
import 'package:dia_app/screens/home/allRouters.dart';
import 'package:flutter/services.dart';
import 'antenna_details.dart';


class AddAntennaPage extends StatelessWidget {
  final AntennaModel antenna;
   final String doc;
  //AddAntennaPage(this.doc,this.antenna);
  AddAntennaPage(this.doc, {Key key, @required this.antenna}) : super(key: key);
  var selectedType;

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController= new TextEditingController();
    _titleController.text = antenna.antennaID;
    TextEditingController _antenaController= new TextEditingController();
    _antenaController.text = antenna.antennafile;

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
    controller: _titleController,
    autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    decoration: InputDecoration(
    labelText: "Antenna Id",
    ),
    ),
      SizedBox(height: 20.0,),
      TextField(
        controller: _antenaController,
        decoration: InputDecoration(
          labelText: "Antenna Type",
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
              antenna.antennaID = _titleController.text;
              antenna.antennafile =_antenaController.text;
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AddAntennaDetail(doc, antenna :antenna)

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

