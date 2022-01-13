part of 'water_mark.dart';

const Color _defaultBackgroundColor = Colors.transparent;

const TextStyle _defaultTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Color(0xFFE7E5E5),
    decoration: TextDecoration.none);

const _WaterMarkTheme defaultTheme = _WaterMarkTheme(
  radius: 10,
  textStyle: _defaultTextStyle,
  textDirection: TextDirection.ltr,
  handleTouch: false,
  child: SizedBox(),
);
