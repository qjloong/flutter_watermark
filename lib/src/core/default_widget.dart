part of 'water_mark.dart';

List<Widget> buildMarkListWidget(widget,
    {rowCount, columnCount, textAlign, textStyle, angle}) {
  List<Widget> list = [];
  for (var i = 0; i < rowCount; i++) {
    Widget child = Expanded(
        child: Row(
      children:
          buildItem(widget: widget, columnCount: columnCount, angle: angle),
    ));
    list.add(child);
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
///
List<Widget> buildMarkList(msg,
    {rowCount, columnCount, textAlign, textStyle, angle, softWrap}) {
  List<Widget> list = [];
  for (var i = 0; i < rowCount; i++) {
    Widget widget = Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buildItem(
          text: msg,
          columnCount: columnCount,
          textAlign: textAlign,
          textStyle: textStyle,
          angle: angle,
          softWrap: softWrap),
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
List<Widget> buildItem(
    {text,
    widget,
    textAlign = TextAlign.center,
    columnCount,
    textStyle,
    angle,
    softWrap}) {
  List<Widget> list = [];
  for (var i = 0; i < columnCount; i++) {
    Widget child = Expanded(
      child: Center(
        child: MeasureSize(
          child: Transform.rotate(
            angle: angle ?? (-pi / 12),
            child: text != null
                ? Text(
                    text,
                    textAlign: textAlign,
                    style: textStyle,
                    softWrap: false, //默认不换行
                  )
                : widget ?? const SizedBox(),
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
    list.add(child);
  }
  return list;
}
