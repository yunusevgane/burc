import '/state_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class uyum extends StatefulWidget {
  String kat;
  String burc;

  uyum({
    Key? key,
    required this.kat,
    required this.burc,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _uyumState createState() => _uyumState();
}

// ignore: camel_case_types
class _uyumState extends State<uyum> {
  List aradetay = [];
  // ignore: non_constant_identifier_names
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
              if (aradetay[i]["burc"] == widget.burc &&
                  aradetay[i]["kat"] == widget.kat)
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 5) - 10,
                    height: (MediaQuery.of(context).size.width / 5) - 10,
                    child: ClipOval(
                        child: Image.asset('assets/burc/${widget.burc}.jpg')),
                  ),
                ),
                const Spacer(),
                Text(Provider.of<StateData>(context)
                    .dil[widget.burc]
                    .toString()),
                const Spacer(),
                if (widget.kat == 'ask')
                  const Icon(
                    Icons.favorite_border,
                    size: 34.0,
                    color: Colors.white,
                  ),
                if (widget.kat == 'cinsellik')
                  const Icon(
                    Icons.hotel_rounded,
                    size: 34.0,
                    color: Colors.white,
                  ),
                if (widget.kat == 'evlilik')
                  const Icon(
                    Icons.gite_outlined,
                    size: 34.0,
                    color: Colors.white,
                  ),
                if (widget.kat == 'arkadaslik')
                  const Icon(
                    Icons.group,
                    size: 34.0,
                    color: Colors.white,
                  ),
                const Spacer(),
                Text(Provider.of<StateData>(context).dil[adi].toString()),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 5) - 10,
                    height: (MediaQuery.of(context).size.width / 5) - 10,
                    child: ClipOval(child: Image.asset('assets/burc/$adi.jpg')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(aradetay[i][adi]),
          ],
        ),
      ),
    );
  }
}
