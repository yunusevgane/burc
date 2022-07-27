import 'package:flutter/material.dart';

class ozellikler extends StatefulWidget {
  const ozellikler({Key? key}) : super(key: key);

  @override
  _ozelliklerState createState() => _ozelliklerState();
}

class _ozelliklerState extends State<ozellikler> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Özellikleriniz'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('ozellikler'),
          ],
        ),
      ),
    );
  }
}
