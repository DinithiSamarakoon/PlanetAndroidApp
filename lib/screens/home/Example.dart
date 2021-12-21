import 'package:flutter/material.dart';


class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(' Checkbox '),),
        body: Container(
            padding: new EdgeInsets.all(22.0),
            child: Column(
              children: <Widget>[
                SizedBox(width: 10,),
                Text('Checkbox with Header and Subtitle',style: TextStyle(fontSize: 20.0), ),
                CheckboxListTile(
                  secondary: const Icon(Icons.alarm),
                  // title: Text(
                  //   v[index].data["sectorid"],
                  //  style: TextStyle(fontSize: 18),
                  // ),
                  title: const Text('Ringing at 4:30 AM every day'),
                  subtitle: Text('Ringing after 12 hours'),
                  value: this.valuefirst,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefirst = value;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: const Icon(Icons.alarm),
                  title: const Text('Ringing at 5:00 AM every day'),
                  subtitle: Text('Ringing after 12 hours'),
                  value: this.valuesecond,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuesecond = value;
                      print(valuesecond);
                    });
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}