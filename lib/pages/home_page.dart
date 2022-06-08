import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/second_page'),
              child: Text('Go to second screen'),
            )
          ],
        ),
      ),
    );
  }
}
