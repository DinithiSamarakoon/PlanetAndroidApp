import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/screens/home/submit_antenna.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/models/antenna.dart';
import 'package:flutter/services.dart';

import 'antennaNew.dart';


class EditAntennaDetail extends StatelessWidget {
  final AntennaModel antenna;
  //antennaid
  //antennaID means selected site id, doc means documentID
  final String antennaID;
  final String doc;
  //EditAntennaDetail(this.antennaID,this.doc);
  EditAntennaDetail(this.antennaID,this.doc,{Key key, @required this.antenna}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Edit Antenna Details '),
      ),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('antenna').document(antennaID).snapshots(),

    builder: (context, snapshot) {
    if (!snapshot.hasData) {
    return new Text("Loading");
    }
    var userDocument = snapshot.data;
    //print(userDocument["antennaID"]);

    TextEditingController _antennaidController= new TextEditingController();
    _antennaidController.text = userDocument['antennaid'];
    TextEditingController _twistController= new TextEditingController();
    _twistController.text = userDocument['twist'];
    TextEditingController _azimuthController= new TextEditingController();
    _azimuthController.text = userDocument['azimuth'];
    TextEditingController _hController= new TextEditingController();
    _hController.text = userDocument['Height'];
    TextEditingController _aController= new TextEditingController();
    _aController.text = userDocument['mechanicaltilt'];
    TextEditingController _antenaController= new TextEditingController();
    _antenaController.text =userDocument['antennafile'];
    return
    Center(
        child: Material(
          elevation: 7.0,
          borderRadius: BorderRadius.circular(7.0),
      child: Container(

      height: 500.0,
      padding: EdgeInsets.all(10.0),
    child: SingleChildScrollView(
    child: Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //children: <Widget>[
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      Text(
        'Site ID :                    '+ doc,
        style: TextStyle(
            fontSize: 17.0
        ),

      ),
      SizedBox(height: 5.0),

      Text(
        'Antenna ID :                    '
            + userDocument['antennaid'].toString() ,

        style: TextStyle(
            fontSize: 17.0
        ),
      ),
      //SizedBox(height: 10.0),
      Text(
        'Antenna File :                    '
            + userDocument['antennafile'].toString() ,

        style: TextStyle(
            fontSize: 17.0
        ),
      ),
      //SizedBox(height: 10.0),
      Container(
        height: 0.5,
        width: double.infinity,
        color: Colors.red,
      ),
      SizedBox(
        height: 15.0,
      ),
      SizedBox(
        height: 27.0,
      ),
    // Text("antennaID ${antenna.antennaID}"),
      //mainAxisAlignment: MainAxisAlignment.center,
      //SizedBox(height: 10.0,),
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


      SizedBox(height: 30.0,),
      TextField(
        controller: _azimuthController,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          labelText: "Azimuth",
        ),
      ),
      SizedBox(height: 30.0,),
      TextField(
        controller: _hController,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          labelText: "Height",
        ),
      ),

      SizedBox(height: 30.0,),
      TextField(
        controller: _aController,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          labelText: "Mechanical Tilt",
        ),
      ),

    RaisedButton(
      color: Colors.deepPurpleAccent,
      child: Text(
        "Finish",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Raleway',
          fontSize: 22.0,
        ),
      ),
    onPressed: () {
    //save data to firestore
    //                 collection('TestSite')
    //                     .document(doc)
     Firestore.instance.collection('antenna').document(antennaID)

        .setData(
         {

           'siteid': doc,
           'antennaid': _antennaidController.text,
           'twist': _twistController.text,
           'azimuth': _azimuthController.text,
           'mechanicaltilt': _aController.text,
           'Height': _hController.text,
           'antennafile': _antenaController.text,
         }

      );
          //Navigator.of(context).popUntil((route) => route.isFirst);
     Navigator.pop(context);
     Navigator.push(context, new MaterialPageRoute(builder: (context) => new Antenna(antennaID,doc)));

    },
      ),
    ],

    ),
    ),
      )
        )
    );
    },
      ),
    );
  }


}
