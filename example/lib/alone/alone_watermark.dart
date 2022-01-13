import 'package:flutter/material.dart';
import 'package:watermark_example/alone/asecond_page.dart';
import 'package:watermark_example/global/global_watermark.dart';
import 'package:watermark_example/global/second_page.dart';
import 'package:watermark_example/main.dart';

class AloneApp extends StatelessWidget {
  const AloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second': (context) => const SecondPage(),
      },
      home: const AloneHome(),
    );
  }
}

class AloneHome extends StatefulWidget {
  const AloneHome({Key? key}) : super(key: key);

  @override
  _AloneHomeState createState() => _AloneHomeState();
}

class _AloneHomeState extends State<AloneHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('单独页面Watermark'),
      ),
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('单独页面Watermark: '),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      //指定跳转的页面
                      return const ASecondPage();
                    },
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("来吧，去看看单个页面的水印，跳转ASecondPage"),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
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
                      return MyApp(
                        key: const Key("default"),
                      );
                    },
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("点我返回起始点"),
                )),
          ],
        ),
      ),
    );
  }
}
