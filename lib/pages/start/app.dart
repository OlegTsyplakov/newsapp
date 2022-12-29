import 'package:flutter/material.dart';
import 'package:newsapp/pages/start/start.dart';
import 'package:newsapp/settings/create_material_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF131313)),
        primaryColor: Colors.white,
        brightness: Brightness.light,
        dividerColor: Colors.black12,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: TextStyle(fontSize: 14.0),
          bodyText2: TextStyle(fontSize: 12.0, color: Colors.red),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: createMaterialColor(Color(0xFF131313)),
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        dividerColor: Colors.black12,
        scaffoldBackgroundColor: const Color(0xFF131313),
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const Start(),
      },
    );
  }
}
