import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ThirdPage"),
      ),
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("ThirdPage"),
            ),
          ],
        ),
      ),
    );
  }
}
