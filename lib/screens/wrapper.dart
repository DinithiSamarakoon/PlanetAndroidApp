import 'package:dia_app/models/user.dart';
import 'package:dia_app/screens/authenticate/authenticate.dart';
import 'package:dia_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or authenticate widget
    //return Authenticate();
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}

