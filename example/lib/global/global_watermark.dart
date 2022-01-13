import 'package:flutter/material.dart';
import 'package:watermark/watermark.dart';
import 'package:watermark_example/alone/alone_watermark.dart';
import 'package:watermark_example/global/second_page.dart';
import 'package:watermark_example/main.dart';

dynamic future;

class GlobalApp extends StatelessWidget {
  GlobalApp({Key? key}) : super(key: key) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      future = showWaterMark("global\n全局页面的水印");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WaterMark(
      child: MaterialApp(
        routes: {
          '/second': (context) => const SecondPage(),
        },
        home: GlobalHome(),
      ),
    );
  }
}

class GlobalHome extends StatefulWidget {
  GlobalHome({Key? key}) : super(key: key) {}

  @override
  _GlobalHomeState createState() => _GlobalHomeState();
}

class _GlobalHomeState extends State<GlobalHome> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   future = showWaterMark(
    //     "global\n全局页面的水印",
    //     context: context,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('全局页面Watermark'),
      ),
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('全局页面Watermark: '),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      //指定跳转的页面
                      return const SecondPage();
                    },
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("点我跳转SecondPage"),
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
            TextButton(
                onPressed: () {
                  dismissAllMark();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("点我关闭全部水印"),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("=====dispose===========");
    future.dismiss();
    future = null;
    super.dispose();
  }
}
