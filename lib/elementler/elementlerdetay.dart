import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import '/state_data.dart';

class elementlerdetay extends StatefulWidget {
  String element;
  elementlerdetay({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  _elementlerdetayState createState() => _elementlerdetayState();
}

class _elementlerdetayState extends State<elementlerdetay> {
  Map aradetay = {};

  Json() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/elementler/index.json');
    var list = json.decode(jsondata) as Map<dynamic, dynamic>;
    aradetay = list[widget.element];
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
              Provider.of<StateData>(context).dil[widget.element].toString()),
          background: Image.asset(
            'assets/elementler/' + widget.element + 'bg.png',
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
