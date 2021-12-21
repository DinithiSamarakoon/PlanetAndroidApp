import 'package:flutter/material.dart';



class MyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text('Select Sector'),
          ),
          body: SafeArea(
              child : Center(

                child:CheckboxWidget(),

              )
          )
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {

  Map<String, bool> values = {
    '3G_A': false,
    'LT23_B': false,
    'L21_4A': false,
    'L21_C': false,
    'L21-A': false,
  };

  var tmpArray = [];

  getCheckboxItems(){

    values.forEach((key, value) {
      if(value == true)
      {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column (children: <Widget>[

      RaisedButton(
        child: Text(" Get Selected Sectors ", style: TextStyle(fontSize: 18),),
        onPressed: getCheckboxItems,
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),

      Expanded(
        child :
        ListView(
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: values[key],
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  values[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),]);
  }
}