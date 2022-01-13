import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watermark/src/widget/measure_widget_size.dart';

/**  本思路来源于网络上看到的文章给了我灵感，具体地址当时没有保留。如需注明请联系我
 * 1、 class =>   with WaterMarkMixin,
 *
 * 2、   Widget build(BuildContext context) {
    return  super.draw(child: 添加你当前页面的widget);
 */
mixin WaterMarkMixin<T extends StatefulWidget> on State<T> {
  Widget draw({
    String text = '',
    required Widget child,
    int rowCount = 5, //行
    int columnCount = 3, //列
    TextDirection direction = TextDirection.ltr,
    TextAlign textAlign = TextAlign.center,
    TextStyle textStyle = const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE7E5E5),
        decoration: TextDecoration.none),
  }) {
    return text.isNotEmpty
        ? Stack(children: [
            child,
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: IgnorePointer(
                child: Directionality(
                  textDirection: direction,
                  child: Column(
                    children: buildMarkList(text,
                        columnCount: columnCount,
                        rowCount: rowCount,
                        textAlign: textAlign,
                        textStyle: textStyle),
                  ),
                ),
              ),
            ),
          ])
        : child;
  }

  /// 原方法来源
  /// @description: water mark can used in page for security .
  /// @author: weichunsheng@jd.com
  /// @date: 2020/8/31 11:44 AM
  /// @version: 1.0
  /// @from: https://github.com/wei-spring/water_mark
  /// @bloc:https://www.cnblogs.com/spring87/p/13597775.html
  ///
  List<Widget> buildMarkList(msg,
      {rowCount, columnCount, textAlign, textStyle}) {
    List<Widget> list = [];

    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
          child: Row(
        children: buildItem(msg,
            columnCount: columnCount,
            textAlign: textAlign,
            textStyle: textStyle),
      ));
      list.add(widget);
    }
    return list;
  }

  /// 原方法来源
  /// @description: water mark can used in page for security .
  /// @author: weichunsheng@jd.com
  /// @date: 2020/8/31 11:44 AM
  /// @version: 1.0
  /// @from: https://github.com/wei-spring/water_mark
  /// @bloc:https://www.cnblogs.com/spring87/p/13597775.html
  ///
  List<Widget> buildItem(text, {textAlign, columnCount, textStyle}) {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
        child: Center(
          child: MeasureSize(
            child: Transform.rotate(
              angle: -pi / 12,
              child: Text(
                text,
                textAlign: textAlign,
                style: textStyle,
              ),
            ),
            onChange: (size) {
              //if (screenSize != null && size != null) {
              //todo
              //如果有需要动态计算水印个数，可以通过屏幕宽高，以及单个水印Widget的宽高，
              // 以及水印间距，算出需要展示水印个数,然后动态展示，
              // 别忘了把Widget换成有状态的动态刷新
              //eg:间距为0个数
              //rowCount = (screenSize.width ~/ size.width) ;
              //columnCount = (screenSize.height ~/ size.height);
              //}
            },
          ),
        ),
      );
      list.add(widget);
    }
    return list;
  }
}
