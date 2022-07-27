import 'state_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class burcuyumu extends StatefulWidget {
  const burcuyumu({Key? key}) : super(key: key);

  @override
  _burcuyumuState createState() => _burcuyumuState();
}

class _burcuyumuState extends State<burcuyumu> {
  @override
  void initState() {
    super.initState();
  }

  String seninburcu = "burcsec";
  String onunburcu = "burcsec";
  String adi = "";
  @override
  Widget build(BuildContext context) {
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
                          Text('Senin BURCU'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                   backgroundColor:Theme.of(context).primaryColorLight,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    for (int i = 0;
                                        i <
                                            Provider.of<StateData>(context)
                                                .dil["burclistesi"]
                                                .length;
                                        i++)
                                      Card(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              seninburcu =
                                                  Provider.of<StateData>(
                                                              context,
                                                              listen: false)
                                                          .dil["burclistesi"][i]
                                                      ["kisa"];
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    Provider.of<StateData>(
                                                                context)
                                                            .dil["burclistesi"]
                                                        [i]["adi"],
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                              Spacer(),
                                              Icon(
                                                color: Colors.white,
                                                Icons
                                                    .keyboard_arrow_right_outlined,
                                                size: 24.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
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
                          Text('Onun BURCU'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                 backgroundColor:Theme.of(context).primaryColorLight,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    for (int i = 0;
                                        i <
                                            Provider.of<StateData>(context)
                                                .dil["burclistesi"]
                                                .length;
                                        i++)
                                      Card(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              onunburcu =
                                                  Provider.of<StateData>(
                                                              context,
                                                              listen: false)
                                                          .dil["burclistesi"][i]
                                                      ["kisa"];
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    Provider.of<StateData>(
                                                                context)
                                                            .dil["burclistesi"]
                                                        [i]["adi"],
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                              Spacer(),
                                              Icon(
                                                color: Colors.white,
                                                Icons
                                                    .keyboard_arrow_right_outlined,
                                                size: 24.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
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
