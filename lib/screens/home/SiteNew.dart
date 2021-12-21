import 'package:dia_app/screens/home/allRouters.dart';
import 'package:dia_app/screens/home/allSectors.dart';
import 'package:dia_app/screens/home/location.dart';
import 'package:dia_app/screens/home/siteDetails.dart';
import 'package:flutter/material.dart';

class Site extends StatelessWidget {
  final doc;
  Site(this.doc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(doc),
      ),
      body: Container(

        padding: EdgeInsets.all(10),

          child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[

            Card(
              elevation: 10,
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push( MaterialPageRoute(builder: (context) => Location(doc),
                      //pass the parameters to SubCategoery class
                    ),
                    );
                  },
                  child: Text('show On Map', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            ),
            ),
            Card(

              elevation: 10,
              child: Center(
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SiteDetails(doc),

                      ),
                      );
                    },
                    child: Text('Details: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
            ),
            Card(
              elevation: 10,
              child: Center(
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllSectors(doc),

                      ),
                      );
                    },
                    child: Text('Sectors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
            ),
            Card(
              elevation: 10,
              child: Center(
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllRoutes(doc),

                      ),
                      );
                    },
                    child: Text('Antenna', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
            ),



          ],
        ),

      ),
    );
  }
}

