import 'package:flutter/material.dart';
import 'package:watermark/watermark.dart';

class AThirdPage extends StatefulWidget {
  const AThirdPage({Key? key}) : super(key: key);

  @override
  _AThirdPageState createState() => _AThirdPageState();
}

class _AThirdPageState extends State<AThirdPage> with WaterMarkMixin {
  WaterMarkFuture? _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _future = showWaterMarkWidget(
        const Icon(Icons.access_time),
        context: context,
      );
    });
  }

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

  @override
  void dispose() {
    _future?.dismiss();
    _future = null;
    super.dispose();
  }
}
