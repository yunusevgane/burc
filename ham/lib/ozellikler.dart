import '/state_data.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

import 'dart:convert';

import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class ozellikler extends StatefulWidget {
  String burc;
  ozellikler({
    Key? key,
    required this.burc,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ozelliklerState createState() => _ozelliklerState();
}

// ignore: camel_case_types
class _ozelliklerState extends State<ozellikler> {
  Map bilgi = {};
  int dddd = 1;
  yukselen() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/ozellikler.json');
    var bilgis = json.decode(jsondata) as Map<dynamic, dynamic>;

    setState(() {
      bilgi = bilgis;
      dddd = 0;
    });
  }

  @override
  void initState() {
    yukselen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (dddd == 1) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Özellikler"),
        ),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  SizedBox(
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset('assets/burc/${widget.burc}.jpg'),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            Provider.of<StateData>(context)
                                .dil[widget.burc]
                                .toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFebcc51))),
                        Text(bilgi[widget.burc]["tarih"].toString().toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFebcc51))),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 75,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     child: Image.asset('assets/burc/' + widget.burc + '.jpg'),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            bilgidetay("elementi"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("niteligi"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("gezegeni"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("rengi"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("tasi"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("gunu"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("anlastigi"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay("anlasamadigi"),
            const Divider(
              color: Colors.white,
            ),
            bilgidetay2("olumlu"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("olumsuz"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("bedende"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("genel"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("erkek"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("kadin"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("tarzi"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("asik"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("anne"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("baba"),
            const SizedBox(
              height: 10,
            ),
            bilgidetay2("cocuk"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }
  }

  bilgidetay(detay) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '${Provider.of<StateData>(context).dil[detay]} : ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              bilgi[widget.burc][detay].toString(),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  bilgidetay2(detay) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          color: const Color.fromARGB(255, 28, 7, 5),
          child: Text(
            Provider.of<StateData>(context).dil[detay].toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bilgi[widget.burc][detay].toString(),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
