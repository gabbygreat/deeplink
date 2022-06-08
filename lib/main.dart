import 'package:deeplink/pages/home_page.dart';
import 'package:deeplink/pages/second_page.dart';
import 'package:flutter/material.dart';


main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep linking',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/second_page': (BuildContext context) => SecondPage()
      },
    );
  }
}
