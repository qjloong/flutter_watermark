# watermark

A pure flutter watermark library

Implement global or partial page watermarking

Flutter 纯dart 实现全局及部分页面的水印

##### 先上截图


| 单个页面的水印     |  自定义水印内容    |  全局水印    |
| ---- | ---- | ---- |
|  ![单个页面的水印](/screen/asecond_page.png)    |  ![自定义水印内容](/screen/athird_widget.png)    |  ![全局水印](/screen/global_page.png)    |



#### 全局水印

> 思路来源 Toast
> 本着不愿意重复造轮子的原则，本项目中代码大部分代码来源于 [flutter_oktoast](https://github.com/OpenFlutter/flutter_oktoast) ，实现过程对非必要内容作了删减。
> 基本上 `toast` 有啥，全局的水印都有。没有的（可能删减过程中弄没了）可以 `fork` 了自己造。
>
> 原理其实很简单，就是在 app 上使用 `Overlay` -> `OverlayEntry` 画了个蒙层。
>
> 默认使用包裹 `MaterialApp` 或 `CupertinoApp` 的方式，不包裹的方式见以下 `example`。
> 
```dart
在pubspec.yaml中添加：
wartermark:
    git:
      url: "https://github.com/Monika-LeeAn/watermark.git"
```

```dart

// example

//lib/global/global_watermark.dart
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
        home: const GlobalHome(),
      ),
    );
  }
}
// lib/global/global_watermark.dart
    GlobalHome
 @override
void dispose() {
   future.dismiss();
   future = null;
   super.dispose();
}

// 不包裹也可以，但得给方法传入context，比如以下 在启动页面的initState()里

class _GlobalHomeState extends State<GlobalHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      future = showWaterMark("global\n全局页面的水印", context: context);
    });
  }
```



#### 单个页面水印

> 单个页面水印思路来源于网络。
>
> 1、`class` 上 `with WaterMarkMixin`
>
> 2、`build` 方法中 使用super.draw  包裹你的布局    return super.draw(child:   ）

```dart
// example
class _ASecondPageState extends State<ASecondPage> with WaterMarkMixin {
  @override
  Widget build(BuildContext context) {
    return super.draw(
        text: "alone\n单个页面水印",
        columnCount: 3,
        rowCount: 5,
        child: Scaffold(

```

