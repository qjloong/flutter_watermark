import 'package:flutter/material.dart';

class AThirdPage extends StatefulWidget {
  const AThirdPage({Key? key}) : super(key: key);

  @override
  _AThirdPageState createState() => _AThirdPageState();
}

class _AThirdPageState extends State<AThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AThirdPage"),
      ),
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("AThirdPage"),
            ),
          ],
        ),
      ),
    );
  }
}
