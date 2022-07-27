import 'state_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

class uyum extends StatefulWidget {
  String kat;
  String burc;

  uyum({
    Key? key,
    required this.kat,
    required this.burc,
  }) : super(key: key);

  @override
  _uyumState createState() => _uyumState();
}

class _uyumState extends State<uyum> {
  List aradetay = [];

  Json() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/uyum.json');
    var list = json.decode(jsondata) as List<dynamic>;
    aradetay = list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Json();
  }

  String adi = "";
  @override
  Widget build(BuildContext context) {
    if (widget.kat == "ask") {
      adi = "Aşk Uyumu";
    } else if (widget.kat == "cinsellik") {
      adi = "Cinsellik Uyumu";
    } else if (widget.kat == "arkadaslik") {
      adi = "Arkadaşlık Uyumu";
    } else if (widget.kat == "evlilik") {
      adi = "Evlilik Uyumu";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(adi),
      ),
      body: ListView(
        children: [
          if (aradetay.length > 1)
            for (int i = 0; i < aradetay.length; i++)
              Column(
                children: [
                  uyum(i, "akrep"),
                  uyum(i, "aslan"),
                  uyum(i, "balik"),
                  uyum(i, "basak"),
                  uyum(i, "boga"),
                  uyum(i, "ikizler"),
                  uyum(i, "koc"),
                  uyum(i, "kova"),
                  uyum(i, "oglak"),
                  uyum(i, "terazi"),
                  uyum(i, "yay"),
                  uyum(i, "yengec"),
                ],
              ),
        ],
      ),
    );
  }

  Card uyum(int i, String adi) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: SizedBox(
                      child: ClipOval(
                          child: Image.asset('assets/burc/' + adi + '.jpg')),
                      width: (MediaQuery.of(context).size.width / 5) - 10,
                      height: (MediaQuery.of(context).size.width / 5) - 10,
                    ),
                  ),
                  Text(Provider.of<StateData>(context).dil[adi].toString()),
                ],
              ),
            ),
            Text(aradetay[i][adi]),
          ],
        ),
      ),
    );
  }
}
