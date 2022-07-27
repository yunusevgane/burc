import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/state_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';

class burchesapla extends StatefulWidget {
  const burchesapla({Key? key}) : super(key: key);

  @override
  _burchesaplaState createState() => _burchesaplaState();
}

class _burchesaplaState extends State<burchesapla> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController dogum = TextEditingController();

  int gun = 0;


tarihhesap() {

  
    final birthday = DateTime.utc(1989, 7, 5);
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



  @override
  Widget build(BuildContext context) {
    final berlinWallFell = DateTime.utc(1989, 11, 9);
        final date2 = DateTime.now();

    print(date2.year);



    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Burç Hesaplama'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/astroloji.jpg'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFebcc51),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DateTimePicker(
                      type: DateTimePickerType.date,
                      dateLabelText: 'Doğum Tarihi',
                      dateMask: 'dd / MM / yyyy',
                      firstDate: DateTime(1600),
                      lastDate: DateTime(3000),
                    ),
                    DateTimePicker(
                      type: DateTimePickerType.time,
                      timeLabelText: "Saat",
                      dateLabelText: 'Doğum Tarihi',
                      use24HourFormat: true,
                    ),
                  ],
                ),
              ),
            ),


            Text(tarihhesap().toString()),
          ],
        ),
      ),
    );
  }
}
