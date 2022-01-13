import 'package:flutter/material.dart';
import 'package:watermark_example/global/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SecondPage"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("SecondPage"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      //指定跳转的页面
                      return const ThirdPage();
                    },
                  ));
                },
                child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("点我跳转ThirdPage"))),
          ],
        ),
      ),
    );
  }
}
