import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

import '/state_data.dart';

class gezegendetay extends StatefulWidget {
  String gezegen;
  gezegendetay({
    Key? key,
    required this.gezegen,
  }) : super(key: key);
  @override
  _gezegendetayState createState() => _gezegendetayState();
}

class _gezegendetayState extends State<gezegendetay> {
  Map aradetay = {};

  Json() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/gezegenler/index.json');
    var list = json.decode(jsondata) as Map<dynamic, dynamic>;
    aradetay = list[widget.gezegen];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Json();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
              Provider.of<StateData>(context).dil[widget.gezegen].toString()),
          background: Image.asset(
            'assets/gezegenler/' + widget.gezegen + 'bg.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      if (aradetay["aciklama"] != null)
        SliverFillRemaining(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget("&nbsp;&nbsp;&nbsp;" + aradetay["aciklama"],
            textStyle: TextStyle(fontSize: 16)),
        ))
    ]));
  }
}
