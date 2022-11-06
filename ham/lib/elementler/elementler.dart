import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

import '/state_data.dart';
import 'elementlerdetay.dart';

// ignore: camel_case_types, must_be_immutable
class elementler extends StatefulWidget {
  const elementler({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _elementlerState createState() => _elementlerState();
}

// ignore: camel_case_types
class _elementlerState extends State<elementler> {
  Map aradetay = {};

  // ignore: non_constant_identifier_names
  Json() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/elementler/index.json');
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
        title:
            Text(Provider.of<StateData>(context).dil["elementler"].toString()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            if (aradetay.length > 1) card('ates'),
            card('hava'),
            card('su'),
            card('toprak'),
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
          burclist =
              "$burclist - ${Provider.of<StateData>(context).dil[aradetay[adi]["burc"][i]]}";
        } else {
          burclist = Provider.of<StateData>(context)
              .dil[aradetay[adi]["burc"][i]]
              .toString();
        }
      }

      return Card(
        elevation: 20,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: elementlerdetay(
                    element: aradetay[adi]["kisa"],
                  )),
            );
          },
          child: ListTile(
            leading:
                Image.asset('assets/elementler/${aradetay[adi]["kisa"]}.png'),
            title: Text(
              aradetay[adi]["adi"].toString(),
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              burclist,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
        ),
      );
    } else {
      return const Text(".");
    }
  }
}
