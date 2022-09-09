import 'package:burc/state_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';



// ignore: camel_case_types
class yukselensec extends StatefulWidget {
  String burc;

  yukselensec({
    Key? key,
    required this.burc,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _yukselensecState createState() => _yukselensecState();
}

class _yukselensecState extends State<yukselensec> {
  String yuk = "akrep";
  int yuksaat = 0;

  String dogumtarihi = DateFormat('yyyy-MM-dd').format(DateTime.now());

  hesap(tarih) {
    var tarih2 = DateTime.parse(tarih);
    var ay = tarih2.month;
    var gun = tarih2.day;
    final birthday = DateTime.utc(2000, 1, 1);
    final date = DateTime.utc(2000, ay, gun);
    return date.difference(birthday).inDays;
  }

  yukselen(saat) async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/yukselen.json');
    var list = json.decode(jsondata) as List<dynamic>;

    for (int i = 0; i < list.length; i++) {
      print(list[i]["min"]);
      if (list[i]["min"] != null) {
        if (saat >= list[i]["min"] && saat <= list[i]["max"]) {
          yuk = list[i][widget.burc].toString();
        }
      }
    }
    yuksaat = saat;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var yil = DateTime.parse(Provider.of<StateData>(context).dogumtarihi);
    // int a = Provider.of<StateData>(context, listen: false).yukselensaat;

    int saat = 0;
    int dakika = 0;
    int a = 0;

    for (var i = 0; i < 25; i++) {
      if (a - (i * 60) < 60) {
        saat = i;
        dakika = a - (i * 60);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<StateData>(context)
            .dil["yukselenhesaplama"]
            .toString()),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    // color: Color(0xFFebcc51),
                  ),
                  child: Column(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          child: Image.asset('assets/burc/' + yuk + '.jpg'),
                          width: (MediaQuery.of(context).size.width * 0.4),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        Provider.of<StateData>(context).dil[yuk].toString(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF022b54),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: TimePickerSpinner(
                        time: DateTime.utc(2000, 01, 01, 00, 00),
                        is24HourMode: true,
                        alignment: Alignment.center,
                        normalTextStyle: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(100, 255, 255, 255)),
                        highlightedTextStyle:
                            TextStyle(fontSize: 24, color: Colors.white),
                        spacing: 25,
                        itemHeight: 30,
                        isForce2Digits: true,
                        // minutesInterval: 15,
                        onTimeChange: (time) {
                          setState(() {
                            print((time.hour * 60) + time.minute);
                            if (time.hour != null) {
                              yukselen(
                                (time.hour * 60) + time.minute,
                              );
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        ":",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
