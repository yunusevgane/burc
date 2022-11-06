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
    Color renk1 = const Color(0xFF2e0a00);
    Color renk2 = const Color.fromARGB(255, 28, 7, 5);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: renk2, // <-- SEE HERE
          onSurface: renk2, // <-- SEE HERE
        ),
        primaryColor: renk2,
        primaryColorLight: renk1,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: renk1,
        drawerTheme: DrawerThemeData(
          backgroundColor: renk1,
        ),
        appBarTheme: AppBarTheme(
          color: renk2,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          color: renk2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: renk2, // foreground (text) color
          ),
        ),
      ),
      home: const anasayfa(),
    );
  }
}
