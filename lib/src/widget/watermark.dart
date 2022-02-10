part of '../core/water_mark.dart';

class WaterMark extends StatefulWidget {
  const WaterMark({
    Key? key,
    required this.child,
    this.textStyle,
    this.radius = 10.0,
    this.textDirection = TextDirection.ltr,
    this.dismissOtherOnShow = false,
    this.movingOnWindowChange = true,
    Color? backgroundColor,
    this.textAlign,
    this.locale,
    this.handleTouch = false,
  })  : backgroundColor = backgroundColor ?? _defaultBackgroundColor,
        super(key: key);

  /// Typically with a [WidgetsApp].
  final Widget child;

  /// Default textStyle of [showWaterMark].
  final TextStyle? textStyle;

  /// Default backgroundColor of [showWaterMark].
  final Color backgroundColor;

  /// Default radius of [showWaterMark].
  final double radius;

  /// Default textDirection of [showWaterMark].
  final TextDirection textDirection;

  /// Default dismissOtherOnShow of [showWaterMark].
  final bool dismissOtherOnShow;

  /// When the screen size changes due to the soft keyboard / rotation screen,
  /// toast will reposition.
  final bool movingOnWindowChange;

  /// Default textAlign of [showWaterMark].
  final TextAlign? textAlign;

  /// Default textAlign of [showWaterMark].
  final Locale? locale;

  /// Whether toast can respond to click events.
  final bool handleTouch;

  @override
  _WaterMarkState createState() => _WaterMarkState();
}

class _WaterMarkState extends State<WaterMark> {
  @override
  void dispose() {
    _contextMap.remove(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Overlay overlay = Overlay(
      initialEntries: <OverlayEntry>[
        OverlayEntry(
          builder: (BuildContext ctx) {
            _contextMap[this] = ctx;
            return widget.child;
          },
        ),
      ],
    );

    final Widget w = Directionality(
      child: overlay,
      textDirection: widget.textDirection,
    );

    final Typography typography = Typography.material2018(
      platform: TargetPlatform.android,
    );
    final TextTheme defaultTextTheme = typography.white;

    final TextStyle textStyle = widget.textStyle ??
        defaultTextTheme.bodyText2?.copyWith(
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ) ??
        _defaultTextStyle;
    ;

    final TextAlign textAlign = widget.textAlign ?? TextAlign.center;

    return Localizations(
      locale: widget.locale ?? const Locale('zh', 'CH'),
      delegates: const <LocalizationsDelegate<dynamic>>[
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      child: MediaQuery(
        data: const MediaQueryData(),
        child: _WaterMarkTheme(
          child: w,
          backgroundColor: widget.backgroundColor,
          radius: widget.radius,
          textStyle: textStyle,
          textAlign: textAlign,
          dismissOtherOnShow: widget.dismissOtherOnShow,
          movingOnWindowChange: widget.movingOnWindowChange,
          textDirection: widget.textDirection,
          handleTouch: widget.handleTouch,
        ),
      ),
    );
  }
}
