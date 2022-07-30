import 'package:burc/state_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

class burcuyumu extends StatefulWidget {
  const burcuyumu({Key? key}) : super(key: key);

  @override
  _burcuyumuState createState() => _burcuyumuState();
}

class _burcuyumuState extends State<burcuyumu> {
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
                        child:
                            Image.asset('assets/burc/' + seninburcu + '.jpg'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Color.fromARGB(255, 1, 27, 48),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            Spacer(),
                            Icon(
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
                        child: Image.asset('assets/burc/' + onunburcu + '.jpg'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Color.fromARGB(255, 1, 27, 48),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6),
                            ),
                            Spacer(),
                            Icon(
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
                                style: TextStyle(
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
                                style: TextStyle(
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
                                style: TextStyle(
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
                                style: TextStyle(
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
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 250,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Senin Burcun'),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Color.fromARGB(255, 1, 27, 48),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6),
                              ),
                              Spacer(),
                              Icon(
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
                          children: [
                            Text('Onun Burcu'),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Color.fromARGB(255, 1, 27, 48),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6),
                              ),
                              Spacer(),
                              Icon(
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
                  style: TextStyle(color: Colors.white)),
            ),
            Spacer(),
            Icon(
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
                  style: TextStyle(color: Colors.white)),
            ),
            Spacer(),
            Icon(
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
