import '/state_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class burcuyumu extends StatefulWidget {
  const burcuyumu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _burcuyumuState createState() => _burcuyumuState();
}

// ignore: camel_case_types
class _burcuyumuState extends State<burcuyumu> {
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

  String seninburcu = "burcsec";
  String onunburcu = "burcsec";

  String adi = "";
  @override
  Widget build(BuildContext context) {
    if (seninburcu != "burcsec" && onunburcu != "burcsec") {
      return Scaffold(
        appBar: AppBar(
          title:
              Text(Provider.of<StateData>(context).dil["burcuyumu"].toString()),
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/burc/$seninburcu.jpg'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: const Color(0xFF2e0a00),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    cardlist("akrep"),
                                    cardlist("aslan"),
                                    cardlist("balik"),
                                    cardlist("basak"),
                                    cardlist("boga"),
                                    cardlist("ikizler"),
                                    cardlist("koc"),
                                    cardlist("kova"),
                                    cardlist("oglak"),
                                    cardlist("terazi"),
                                    cardlist("yay"),
                                    cardlist("yengec"),
                                  ],
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              Provider.of<StateData>(context)
                                  .dil[seninburcu]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/burc/$onunburcu.jpg'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: const Color(0xFF2e0a00),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    cardlist2("akrep"),
                                    cardlist2("aslan"),
                                    cardlist2("balik"),
                                    cardlist2("basak"),
                                    cardlist2("boga"),
                                    cardlist2("ikizler"),
                                    cardlist2("koc"),
                                    cardlist2("kova"),
                                    cardlist2("oglak"),
                                    cardlist2("terazi"),
                                    cardlist2("yay"),
                                    cardlist2("yengec"),
                                  ],
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              Provider.of<StateData>(context)
                                  .dil[onunburcu]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (aradetay.length > 1)
              for (int i = 0; i < aradetay.length; i++)
                Column(
                  children: [
                    if (aradetay[i]["burc"] == seninburcu &&
                        aradetay[i]["kat"] == "ask")
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<StateData>(context)
                                    .dil["ask"]
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aradetay[i][onunburcu].toString()),
                            ],
                          ),
                        ),
                      ),
                    if (aradetay[i]["burc"] == seninburcu &&
                        aradetay[i]["kat"] == "cinsellik")
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<StateData>(context)
                                    .dil["cinsellik"]
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aradetay[i][onunburcu].toString()),
                            ],
                          ),
                        ),
                      ),
                    if (aradetay[i]["burc"] == seninburcu &&
                        aradetay[i]["kat"] == "evlilik")
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<StateData>(context)
                                    .dil["evlilik"]
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aradetay[i][onunburcu].toString()),
                            ],
                          ),
                        ),
                      ),
                    if (aradetay[i]["burc"] == seninburcu &&
                        aradetay[i]["kat"] == "arkadaslik")
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<StateData>(context)
                                    .dil["arkadaslik"]
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(aradetay[i][onunburcu].toString()),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title:
              Text(Provider.of<StateData>(context).dil["burcuyumu"].toString()),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('Senin Burcun'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: const Color(0xFF2e0a00),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    cardlist("akrep"),
                                    cardlist("aslan"),
                                    cardlist("balik"),
                                    cardlist("basak"),
                                    cardlist("boga"),
                                    cardlist("ikizler"),
                                    cardlist("koc"),
                                    cardlist("kova"),
                                    cardlist("oglak"),
                                    cardlist("terazi"),
                                    cardlist("yay"),
                                    cardlist("yengec"),
                                  ],
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              Provider.of<StateData>(context)
                                  .dil[seninburcu]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text('Onun Burcu'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: const Color(0xFF2e0a00),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    cardlist2("akrep"),
                                    cardlist2("aslan"),
                                    cardlist2("balik"),
                                    cardlist2("basak"),
                                    cardlist2("boga"),
                                    cardlist2("ikizler"),
                                    cardlist2("koc"),
                                    cardlist2("kova"),
                                    cardlist2("oglak"),
                                    cardlist2("terazi"),
                                    cardlist2("yay"),
                                    cardlist2("yengec"),
                                  ],
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              Provider.of<StateData>(context)
                                  .dil[onunburcu]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Card cardlist2(adi) {
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            onunburcu = adi;
          });
          Navigator.of(context).pop();
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Provider.of<StateData>(context).dil[adi],
                  style: const TextStyle(color: Colors.white)),
            ),
            const Spacer(),
            const Icon(
              color: Colors.white,
              Icons.keyboard_arrow_right_outlined,
              size: 24.0,
            )
          ],
        ),
      ),
    );
  }

  Card cardlist(adi) {
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            seninburcu = adi;
          });
          Navigator.of(context).pop();
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Provider.of<StateData>(context).dil[adi],
                  style: const TextStyle(color: Colors.white)),
            ),
            const Spacer(),
            const Icon(
              color: Colors.white,
              Icons.keyboard_arrow_right_outlined,
              size: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
