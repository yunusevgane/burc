import 'package:flutter/material.dart';

class diller extends StatefulWidget {
  const diller({Key? key}) : super(key: key);

  @override
  _dillerState createState() => _dillerState();
}

class _dillerState extends State<diller> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dil'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Türkçe'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('İngilzice'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Almanca'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Rusça'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Arapça'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('İspanyolca'),
            ),
          ),
        ],
      ),
    );
  }
}
