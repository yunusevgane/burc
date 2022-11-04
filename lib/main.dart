import 'state_data.dart';
import 'package:flutter/material.dart';
import 'anasayfa.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StateData().createStatePrefObject();
  runApp(ChangeNotifierProvider<StateData>(
      create: (BuildContext context) {
        return StateData();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StateData>(context, listen: false).ilkadim();
    Color renk1 = const Color(0xFF022b54);
    Color renk3 = const Color(0xFF02345d);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: renk3, // <-- SEE HERE
          onSurface: renk3, // <-- SEE HERE
        ),
        primaryColor: renk3,
        primaryColorLight: renk1,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: renk1,
        drawerTheme: DrawerThemeData(
          backgroundColor: renk1,
        ),
        appBarTheme: AppBarTheme(
          color: renk3,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          color: renk3,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: renk3, // foreground (text) color
          ),
        ),
      ),
      home: const anasayfa(),
    );
  }
}
