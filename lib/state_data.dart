import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class StateData with ChangeNotifier {
  static late SharedPreferences _Lveri;

  String dili = ui.window.locale.languageCode;

  Map dil = {};
  String dilim = "tr";
  String dosya = "";

  Future<void> createStatePrefObject() async {
    _Lveri = await SharedPreferences.getInstance();
  }

  Future<void> dilsec(String diladi) async {
    dilim = diladi;
    _Lveri.setString('dil', diladi);
    var data = await rootBundle.loadString('assets/' + diladi + '.json');
    var jsonResponse = json.decode(data);
    dil = jsonResponse;
    notifyListeners();
  }

  void ilkadim() async {
    String diladi = _Lveri.getString('dil').toString();
    if (_Lveri.getString('dil') != null) {
      dilsec(diladi);
    } else {
      // dilsec(ui.window.locale.languageCode);
      dilsec("tr");
    }
  }

  @override
  notifyListeners();
}
