part of 'water_mark.dart';

List<Widget> buildMarkListWidget(widget,
    {rowCount, columnCount, textAlign, textStyle, angle}) {
  return List.filled(
      rowCount,
      Expanded(
          child: Row(
        children:
            buildItem(widget: widget, columnCount: columnCount, angle: angle),
      )));
}

List<Widget> buildMarkList(msg,
    {rowCount, columnCount, textAlign, textStyle, angle, softWrap}) {
  return List.filled(
      rowCount,
      Expanded(
          child: Row(
        children: List.filled(
            columnCount,
            itemView(
                text: msg,
                textAlign: textAlign,
                textStyle: textStyle,
                angle: angle,
                softWrap: softWrap)),
      )));
}

List<Widget> buildItem(
    {text,
    widget,
    textAlign = TextAlign.center,
    columnCount,
    textStyle,
    angle,
    softWrap}) {
  return List.filled(
      columnCount,
      itemView(
          text: text,
          textAlign: textAlign,
          textStyle: textStyle,
          angle: angle,
          softWrap: softWrap,
          widget: widget));
}

Expanded itemView({angle, text, textAlign, textStyle, widget, softWrap}) {
  return Expanded(
      child: MeasureSize(
    child: Transform.rotate(
      angle: angle ?? (-pi / 12),
      child: text != null
          ? Center(
              child: Text(
                text,
                textAlign: textAlign,
                style: textStyle,
                softWrap: softWrap, //默认不换行
              ),
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
  ));
}
