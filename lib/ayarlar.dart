import 'state_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ayarlar extends StatefulWidget {
  const ayarlar({Key? key}) : super(key: key);

  @override
  _ayarlarState createState() => _ayarlarState();
}

class _ayarlarState extends State<ayarlar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        Provider.of<StateData>(context)
                                            .dil["burclistesi"][i]["adi"],
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
                            )
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: const [
                    Text(
                      'Burcunuzu Seçin',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text(
                      'Aslan',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 24.0,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        Provider.of<StateData>(context)
                                            .dil["burclistesi"][i]["adi"],
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
                            )
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Yükseliniz Seçin',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text("Başak"),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        Provider.of<StateData>(context)
                                            .dil["burclistesi"][i]["adi"],
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
                            )
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Hissettiğiniz Cinsiyet',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text("Erkek"),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 24.0,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Türkçe",
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("İngilizce",
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Almanca",
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Fransızca",
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("İtalyanca",
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Arapça",
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
                          Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Rusya",
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
                          )
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Dil',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text("Türkçe"),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 24.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
