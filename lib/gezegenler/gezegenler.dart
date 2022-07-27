import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../state_data.dart';
import 'gezegendetay.dart';

class gezegenler extends StatefulWidget {
  const gezegenler({Key? key}) : super(key: key);

  @override
  _gezegenlerState createState() => _gezegenlerState();
}

class _gezegenlerState extends State<gezegenler> {
  Map aradetay = {};

  Json() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/gezegenler/index.json');
    var list = json.decode(jsondata) as Map<dynamic, dynamic>;
    aradetay = list;
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
      appBar: AppBar(
        title: Text(Provider.of<StateData>(context)
            .dil["gezegenlerveetkileri"]
            .toString()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            if (aradetay.length > 1)
              Card(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                elevation: 20,
                child: ListTile(
                  title: Text(
                    Provider.of<StateData>(context)
                        .dil["klasikgezegenler"]
                        .toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            card('ay'),
            card('gunes'),
            card('jupiter'),
            card('mars'),
            card('merkur'),
            card('saturn'),
            card('venus'),
            Card(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              elevation: 20,
              child: ListTile(
                title: Text(
                  Provider.of<StateData>(context)
                      .dil["moderngezegenler"]
                      .toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            card('uranus'),
            card('neptun'),
            card('pluton'),
          ],
        ),
      ),
    );
  }

  card(adi) {
    if (aradetay.length > 1) {
      String burclist = "";
      for (int i = 0; i < aradetay[adi]["burc"].length; i++) {
        if (burclist != "") {
          burclist = burclist +
              " - " +
              Provider.of<StateData>(context)
                  .dil[aradetay[adi]["burc"][i]]
                  .toString();
        } else {
          burclist = Provider.of<StateData>(context)
              .dil[aradetay[adi]["burc"][i]]
              .toString();
        }
      }

      return Card(
        elevation: 20,
        child: new InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: gezegendetay(
                    gezegen: aradetay[adi]["kisa"],
                  )),
            );
          },
          child: ListTile(
            leading: Image.asset('assets/gezegenler/' +
                aradetay[adi]["kisa"].toString() +
                '.png'),
            title: Text(
              aradetay[adi]["adi"].toString(),
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              burclist,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
        ),
      );
    } else {
      return Text(".");
    }
  }
}
