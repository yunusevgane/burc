import 'state_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class ayarlar extends StatefulWidget {
  const ayarlar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ayarlarState createState() => _ayarlarState();
}

// ignore: camel_case_types
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
                    backgroundColor: Theme.of(context).primaryColorLight,
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
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                  const Spacer(),
                                  const Icon(
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
                    SizedBox(
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
                    backgroundColor: Theme.of(context).primaryColorLight,
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
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                  const Spacer(),
                                  const Icon(
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
                      'Yükseliniz Seçin',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text("Başak"),
                    SizedBox(
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
                    backgroundColor: Theme.of(context).primaryColorLight,
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
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                  const Spacer(),
                                  const Icon(
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
                      'Hissettiğiniz Cinsiyet',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text("Erkek"),
                    SizedBox(
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
                    backgroundColor: Theme.of(context).primaryColorLight,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Card(
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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
                  children: const [
                    Text(
                      'Dil',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.6),
                    ),
                    Spacer(),
                    Text("Türkçe"),
                    SizedBox(
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
