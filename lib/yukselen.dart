import 'state_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'package:provider/provider.dart';

class yukselen extends StatefulWidget {
  String burc;
  yukselen({
    Key? key,
    required this.burc,
  }) : super(key: key);

  @override
  _yukselenState createState() => _yukselenState();
}

class _yukselenState extends State<yukselen> {
  List aradetay = [];

  Json() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/yukselen.json');
    var list = json.decode(jsondata) as List<dynamic>;
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Yükselen Hesaplama'),
              background: Image.asset(
                'assets/burc/' + widget.burc + '.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (aradetay.length > 1)
            SliverFixedExtentList(
              itemExtent: 75.0,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                if (aradetay.length > 1)
                  return Card(
                    child: ListTile(
                      subtitle: Text(
                          Provider.of<StateData>(context)
                              .dil[aradetay[index][widget.burc].toString()]
                              .toString(),
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      title: Text(
                        aradetay[index]['saat'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Image.asset('assets/burc/' +
                          aradetay[index][widget.burc].toString() +
                          '.jpg'),

                      // trailing:Text("Doğum Saati")
                    ),
                  );
              }, childCount: 12),
            ),
        ],
      ),
    );
  }
}
