import 'package:flutter/material.dart';
import 'package:watermark/watermark.dart';

import 'athird_page.dart';

class ASecondPage extends StatefulWidget {
  const ASecondPage({Key? key}) : super(key: key);

  @override
  _ASecondPageState createState() => _ASecondPageState();
}

class _ASecondPageState extends State<ASecondPage> with WaterMarkMixin {
  @override
  Widget build(BuildContext context) {
    return super.draw(
        text: "alone\n单个页面水印",
        columnCount: 3,
        rowCount: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("ASecondPage"),
          ),
          body: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("ASecondPage"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          //指定跳转的页面
                          return const AThirdPage();
                        },
                      ));
                    },
                    child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("点我跳转AThirdPage"))),
              ],
            ),
          ),
        ));
  }
}
