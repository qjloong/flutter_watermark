part of '../core/water_mark.dart';

class _WaterMarkTheme extends InheritedWidget {
  const _WaterMarkTheme({
    required this.textStyle,
    required this.textDirection,
    required this.handleTouch,
    required this.radius,
    required Widget child,
    this.backgroundColor = Colors.black,
    this.dismissOtherOnShow = true,
    this.movingOnWindowChange = true,
    this.textAlign,
  }) : super(child: child);

  static _WaterMarkTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_WaterMarkTheme>() ??
      defaultTheme;

  final TextStyle textStyle;
  final Color backgroundColor;
  final double radius;
  final bool dismissOtherOnShow;
  final bool movingOnWindowChange;
  final TextDirection textDirection;
  final TextAlign? textAlign;
  final bool handleTouch;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
