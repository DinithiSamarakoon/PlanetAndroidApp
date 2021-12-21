import 'package:dia_app/screens/home/add_antenna.dart';
import 'package:dia_app/screens/home/antennaNew.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_app/models/antenna.dart';
class AllRoutes extends StatefulWidget {

  final doc;
  AllRoutes(this.doc);

  @override
  _AllRoutesState createState() => _AllRoutesState();
}

class _AllRoutesState extends State<AllRoutes> {

  bool isSearching =false;
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // getSites();
    final newAntenna = new AntennaModel( null, null,null,null,null,null,null);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: !isSearching ? Text('Antenna')
              : TextField(
            // controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(Icons.search,
                  color: Colors.white,),
                hintText: "Search antennas here",
                hintStyle: TextStyle(color: Colors.white)
            ),
          ),
          actions: <Widget>[
            isSearching ?
            IconButton(
                icon: Icon(Icons.cancel),
                onPressed: (){
                  setState(() {
                    this.isSearching = false;
                  });

                }
            )
                : IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  setState(() {
                    this.isSearching = true;
                  });

                }
            )
          ],
        ),
        body: StreamBuilder(
          stream: db
              .collection('antenna')

            //Antennas
          //.where("siteid" isEqualTo, widget.doc)
          .where("siteid", isEqualTo:widget.doc)
              .snapshots(),
            //     .collection('TestSite')
            // .document(widget.doc)
            // .collection('Antennas')
            // .snapshots(),

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var v = snapshot.data.documents;
              return new ListView.builder(
                  itemCount: v.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(v[index].documentID);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                              //v[index].documentID-->Document ID
                                  Antenna(v[index].documentID,widget.doc),

                            //pass the parameters to SubCategoery class
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          child: Text(
                            //.document(antennaID)
                                //db.collection("Antennas").document(v[index].documentID).documentSnapshot.getString(field:"antennafile"),
                             v[index].data["antennafile"] +
                                " (" +  v[index].data["antennaid"].toString()+ ")" ,
                                  //.getData()
                              //antennaid.toString(),
                             // print(songsQuery.documents[1].documentID);
                              style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return LinearProgressIndicator();
            }
          },

        ),
        // floatingActionButton: FloatingActionButton(
        // backgroundColor: Color(0xFFFA7397),
        //   child: Icon(
        //     FontAwesomeIcons.listU1,
        //
      floatingActionButton: FloatingActionButton(

        child:Icon(Icons.add,   color: Colors.pink,),

        onPressed:(){
          Navigator.push(context, MaterialPageRoute(
            //builder: (context) => AddAntennaPage( widget.doc)
              builder: (context) => AddAntennaPage( widget.doc, antenna :newAntenna)
              //widget.doc
          ),);
        }
      ),
          );





  }
}










