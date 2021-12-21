import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: new AppBar(
        title: new Text("Profile Page"),
        backgroundColor: Colors.pink,
      ),
      body: Text('Profile'),
    );
  }
}
