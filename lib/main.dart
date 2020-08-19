import 'package:flutter/material.dart';

import 'package:covid_test_des/src/pages/home_page.dart';
import 'package:covid_test_des/src/pages/lavar_manos_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Design',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'lavar_manos': (BuildContext context) => LavarManosPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
    );
  }
}