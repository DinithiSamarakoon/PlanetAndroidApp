import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/models/antenna.dart';
import 'package:dia_app/screens/home/submit_antenna.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:wishflutternew/constants.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _sectorCollection = _firestore.collection("Sectors");
class DropDownSelectors extends StatefulWidget {
  //final AntennaModel antenna;
  final String antennaID;
  final String doc;
  DropDownSelectors(this.antennaID,this.doc);
 // DropDownSelectors(this.doc,) : super();
  @override
  _DropDownSelectorsState createState() => _DropDownSelectorsState();
}

class _DropDownSelectorsState extends State<DropDownSelectors> {

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final List<String> options = [];
  final db = Firestore.instance;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // TextEditingController _sController= new TextEditingController();
    // _sController.text = widget.antenna.sectors;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.doc),
    ),
    body: Center(
        child: SingleChildScrollView(
         // height: 500,
          child: FormBuilder(
            autovalidateMode: AutovalidateMode.always,
            key: _fbKey,
            child: Column(
              children: [
                Card(
                  child: new StreamBuilder<QuerySnapshot>(
                      stream: db.collection('Sectors')
                          .where("siteid", isEqualTo:widget.antennaID)
                      // .orderBy("sectorid", descending: false)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Something went wrong!"),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data.documents.length != 0) {
                          print(snapshot.data.documents[1].data["sectorid"]);
                          return ExpansionTile(
                            //iconColor: CustomColors.firebaseOrange,
                            //textColor: CustomColors.firebaseYellow,
                            title: Text('Select Sectors'),
                            // value: _categoryDropdownValue,
                            // icon: Icon(Icons.arrow_downward),
                            // iconSize: 24,
                            // elevation: 16,
                            // style: TextStyle(color: Colors.deepPurple),
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FormBuilderCheckboxGroup(
                                      orientation: OptionsOrientation.vertical,
                                      activeColor: Colors.pink,
                                      checkColor: Colors.yellow,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                      ),
                                      onChanged: (values) {
                                        options.clear();
                                        print(values);
                                        values.forEach((e) => options.add(e as String));
                                        setState(() {});
                                        },
                                      //name: "Sectors",
                                      options: snapshot.data.documents
                                          .map((element) =>
                                      new FormBuilderFieldOption(
                                          value: element["sectorid"]))
                                          .toList()))
                            ],
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data.documents.length == 0) {
                          return Card(
                            child: Text("There are no sectors!"),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.red
                              //CustomColors.firebaseOrange,
                            ),
                          ),
                        );
                      }),
                ),
                RaisedButton(
                  child: Text("Finish"),
                  onPressed: () async{

                    await
                    Firestore.instance.collection('antenna').document(widget.doc)
                        .updateData({"sector": FieldValue.arrayUnion(options)});

                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
      ]
    ),
          ),
        ),
    ),
    );

  }
}


