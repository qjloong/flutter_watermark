import 'package:flutter/material.dart';
import 'package:watermark_example/alone/alone_watermark.dart';
import 'package:watermark_example/global/global_watermark.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Running on: '),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    //指定跳转的页面
                    return GlobalApp(
                      key: const Key("Global"),
                    );
                  },
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("点我跳转全局水印"),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    //指定跳转的页面
                    return AloneApp(
                      key: const Key("alone"),
                    );
                  },
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("点我跳转单个页面的水印"),
              )),
        ],
      ),
    );
  }
}
