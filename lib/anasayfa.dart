import 'package:burc/yukselensec.dart';

import 'dil.dart';
import 'ozellikler.dart';
import 'state_data.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' as rootBundle;
import 'package:animate_do/animate_do.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'ayarlar.dart';
import 'burchesapla.dart';
import 'elementler/elementler.dart';
import 'elementler/elementlerdetay.dart';
import 'gezegenler/gezegendetay.dart';
import 'uyum.dart';
import 'burcuyumu.dart';
import 'astrolojinedir.dart';
import 'gezegenler/gezegenler.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  _anasayfaState createState() => _anasayfaState();
}

List burcyorum = [];
Map burclar = {};
String version = "";

String dil = "tr";
String dosya = "";

DateTime now = DateTime.now();
String baslik = DateFormat('dd / MMMM / yyyy').format(now);

class _anasayfaState extends State<anasayfa>
    with SingleTickerProviderStateMixin {
  String appName = "aslan";
  String packageName = "aslan";
  late TabController _tabController;
  Future<String> verisonal() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    packageName = packageName.replaceAll("com.zodcomburclar.", '');

    version = packageInfo.version;
    setState(() {});
    return packageInfo.buildNumber;
  }

  ReadJsonData() async {
    final jsondatass =
        await rootBundle.rootBundle.loadString('assets/yorum.json');
    var listss = json.decode(jsondatass) as List<dynamic>;
    burcyorum = listss;

    final jsondatas =
        await rootBundle.rootBundle.loadString('assets/burclar.json');
    var lists = json.decode(jsondatas) as Map<dynamic, dynamic>;
    burclar = lists;
    setState(() {});
  }

  tarihhesap() {
    final birthday = DateTime(DateTime.now().year);
    final date2 = DateTime.now();
    var difference = date2.difference(birthday).inDays;
    if (difference > 365) {
      if (difference / 365 > 1) {
        difference = difference - (365 * (difference / 365).toInt());
      } else {
        difference = difference - 365;
      }
    }
    return difference;
  }

  String burckayit = "1";

  verioku() async {
    final prefs = await SharedPreferences.getInstance();
    var burckayits = prefs.getString('burc');
    // burckayit = burckayits!;
    // print(prefs.getString('burc'));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    verisonal();
    ReadJsonData();
  }

  Color renk1 = Color(0xFF0f3983);

  @override
  Widget build(BuildContext context) {
    verioku();

    if (burcyorum.length > 0) {
      return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Center(child: Text(baslik)),
          actions: [
            ZoomIn(
              child: IconButton(
                icon: Icon(
                  size: 28.0,
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ayarlar(),
                    ),
                  );
                },
              ),
            ),
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.sort_sharp,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 120,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      image: DecorationImage(
                          image: AssetImage("assets/icbg.png"),
                          fit: BoxFit.cover)),
                  child: Row(
                    children: [
                      ClipOval(
                        child:
                            Image.asset('assets/burc/' + packageName + '.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Provider.of<StateData>(context)
                                .dil[packageName]
                                .toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            Provider.of<StateData>(context)
                                .dil["gunlukburcyorumlari"]
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: astrolojinedir()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Provider.of<StateData>(context)
                        .dil["astrolojinedir"]
                        .toString()),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: gezegenler()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Provider.of<StateData>(context)
                        .dil["gezegenlerveetkileri"]
                        .toString()),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: elementler()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Provider.of<StateData>(context)
                        .dil["elementler"]
                        .toString()),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: burcuyumu()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Provider.of<StateData>(context)
                        .dil["burcuyumu"]
                        .toString()),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: yukselensec(
                            burc: packageName,
                          )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Provider.of<StateData>(context)
                        .dil["yukselenhesaplama"]
                        .toString()),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ayarlar()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Provider.of<StateData>(context)
                        .dil["ayarlar"]
                        .toString()),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(child: Text("App Verison : " + version)),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: burcum(packageName),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
          extendBody: true,
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(child: CircularProgressIndicator())));
    }
  }

  burcum(String adi) {
    String yorumtum = "";
    var liss =
        burcyorum.where((arayici) => arayici["burc"].contains(adi)).toList();

    int a1 = 0;
    int tarihsayi = tarihhesap();

    int a = 0;
    for (var i = 1; i < 5; i++) {
      a = i;
      if (liss.length > tarihsayi + a) {
        a1 = tarihsayi + a;
        a = 1;
      } else if (((liss.length * 2)) > tarihsayi + a) {
        a1 = (liss.length * 2) - (tarihsayi + a);
        a = 2;
      } else if (((liss.length * 3)) > tarihsayi + a) {
        a1 = (liss.length * 3) - (tarihsayi + a);
        a = 3;
      } else if (((liss.length * 4)) > tarihsayi + a) {
        a1 = (liss.length * 4) - (tarihsayi + a);
        a = 4;
      } else if (((liss.length * 5)) > tarihsayi + a) {
        a1 = (liss.length * 5) - (tarihsayi + a);
        a = 5;
      } else if (((liss.length * 6)) > tarihsayi + a) {
        a1 = (liss.length * 6) - (tarihsayi + a);
        a = 6;
      } else {
        a1 = 20;
      }
      a1 = a1 - 1;
      yorumtum = "${yorumtum + liss[a1]["yorum"]} ";
    }

    return ListView(
      children: [
        if (burclar[adi] != null)
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
            width: (MediaQuery.of(context).size.width),
            height: MediaQuery.of(context).size.height - 150,
            // height: MediaQuery.of(context).size.height - 250,
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 75.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(70, 0, 0, 0),
                  ),
                  width: (MediaQuery.of(context).size.width),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                FadeInLeft(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: gezegendetay(
                                                  gezegen: burclar[adi]
                                                      ["gezegen"],
                                                )),
                                          );
                                        },
                                        child: SizedBox(
                                          child: Image.asset(
                                              'assets/gezegenler/' +
                                                  burclar[adi]["gezegen"] +
                                                  '.png'),
                                          width: 75,
                                          height: 75,
                                        ),
                                      ),
                                      Text(burclar[adi][dil]["gezegen"])
                                    ],
                                  ),
                                ),
                                Spacer(),
                                FadeInUp(
                                  child: Column(
                                    children: [
                                      ClipOval(
                                        child: SizedBox(
                                          child: Image.asset('assets/burc/' +
                                              packageName +
                                              '.jpg'),
                                          width: 150,
                                          height: 150,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                FadeInRight(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: elementlerdetay(
                                                  element: burclar[adi]
                                                      ["elemet"],
                                                )),
                                          );
                                        },
                                        child: SizedBox(
                                          child: Image.asset(
                                              'assets/elementler/' +
                                                  burclar[adi]["elemet"] +
                                                  '.png'),
                                          width: 75,
                                          height: 75,
                                        ),
                                      ),
                                      Text(burclar[adi][dil]["elemet"])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            FadeInUp(
                              delay: const Duration(milliseconds: 500),
                              child: Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Text(burclar[adi][dil]["name"].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(burclar[adi][dil]["tarih"].toString()),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeInUp(
                              delay: const Duration(milliseconds: 800),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Text(
                                  yorumtum,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ozellikleri(adi),
      ],
    );
  }

  ozellikleri(burc) {
    return FadeInUp(
      delay: const Duration(milliseconds: 500),
      child: Container(
        // margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 60,
        child: SingleChildScrollView(
          reverse: false,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: uyum(
                          kat: "ask",
                          burc: burc,
                        ),
                      ),
                    );
                  }, // Handle your callback
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: renk1,
                    ),
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 24.0,
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          Provider.of<StateData>(context).dil["ask"].toString(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 1000),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: uyum(
                          kat: "cinsellik",
                          burc: burc,
                        ),
                      ),
                    );
                  }, // Handle your callback
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: renk1,
                    ),
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 24.0,
                            Icons.hotel_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Text(Provider.of<StateData>(context)
                            .dil["cinsellik"]
                            .toString()),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 1200),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: uyum(
                          kat: "evlilik",
                          burc: burc,
                        ),
                      ),
                    );
                  }, // Handle your callback
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: renk1,
                    ),
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 24.0,
                            Icons.gite_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(Provider.of<StateData>(context)
                            .dil["evlilik"]
                            .toString()),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 1400),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: uyum(
                          kat: "arkadaslik",
                          burc: burc,
                        ),
                      ),
                    );
                  }, // Handle your callback
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: renk1,
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 24.0,
                            Icons.group,
                            color: Colors.white,
                          ),
                        ),
                        Text(Provider.of<StateData>(context)
                            .dil["arkadaslik"]
                            .toString()),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 1600),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ozellikler(),
                      ),
                    );
                  }, // Handle your callback
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: renk1,
                    ),
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 24.0,
                            Icons.fingerprint,
                            color: Colors.white,
                          ),
                        ),
                        Text(Provider.of<StateData>(context)
                            .dil["ozellikleriniz"]
                            .toString()),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 1800),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: yukselensec(
                          burc: burc,
                        ),
                      ),
                    );
                  }, // Handle your callback
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: renk1,
                    ),
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 24.0,
                            Icons.find_replace,
                            color: Colors.white,
                          ),
                        ),
                        Text(Provider.of<StateData>(context)
                            .dil["yukselenibul"]
                            .toString()),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
