import 'package:dia_app/screens/home/HomePage.dart';
import 'package:dia_app/screens/home/searchsite.dart';
//above one for AllSites
import 'package:dia_app/screens/home/site.dart';
import 'package:dia_app/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:dia_app/screens/home/Profile.dart';
import 'package:dia_app/screens/home/settings.dart';
import 'Example.dart';
import 'ExampleOne.dart';
import 'ExampleTwo.dart';
import 'SectorAddingPage.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer
      drawer: new Drawer(
        //backgroundColor: Colors.pink,
        child: new ListView(

          children: <Widget>
          [

            new DrawerHeader
              (
                child: Text("MY Drawer Header"),
                decoration: new BoxDecoration(
                  color: Colors.pink,
                 // backgroundColor: Colors.pink,
                ),
              ),
           new ListTile
              (
              title: new Text("Sector Page"),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SectorPage()));
              },
              ),
            new ListTile
              (
              title: new Text("Test Page"),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ExamplePage()));
              },
            ),

            new ListTile
              (
              title: new Text("SectorView Page"),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyExample()));
              },
            ),
            // new ListTile
            //   (
            //   title: new Text("Sector"),
            //   onTap: ()
            //   {
            //     Navigator.pop(context);
            //     Navigator.push(context, new MaterialPageRoute(builder: (context) => new DropDownSelectors()));
            //   },
            // ),
            new ListTile
              (
              title: new Text("Antenna Page"),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new DropDownSelector()));
              },
            ),
            // new ListTile
            //   (
            //   title: new Text("SiteHome1 Page"),
            //   onTap: ()
            //   {
            //     Navigator.pop(context);
            //     Navigator.push(context, new MaterialPageRoute(builder: (context) => new SiteHome()));
            //   },
            // ),

            // new ListTile
            //   (
            //   title: new Text("SIte1 Page"),
            //   onTap: ()
            //   {
            //     Navigator.pop(context);
            //     Navigator.push(context, new MaterialPageRoute(builder: (context) => new SiteReview()));
            //   },
            // ),
            new ListTile
              (
              title: new Text("Antenna changed Page"),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SectorAddingPage()));
              },
            ),
            new ListTile
              (
              title: new Text("Sites Details"),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new AllSites()));
              },
            ),
            new ListTile(
              title: new Text("Profile Settings"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProfilePage()));
              },
            ),
            new ListTile(
              title: new Text("Setting"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Settings()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Dial App'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
          )

        ],
      ),
    body: new Container(
      child: HomePage()
    )

    );
  }
}
