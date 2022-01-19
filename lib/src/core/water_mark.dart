import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Overlay, OverlayEntry, OverlayState;

import '../widget/measure_widget_size.dart';
import 'watermark_manager.dart';

part '../widget/theme.dart';
part '../widget/watermark.dart';
part 'default_themes.dart';
part 'default_widget.dart';
part 'watermark_future.dart';

final LinkedHashMap<_WaterMarkState, BuildContext> _contextMap =
    LinkedHashMap<_WaterMarkState, BuildContext>();

/// Show watermark with [msg],
WaterMarkFuture showWaterMark(
  String msg, {
  BuildContext? context,
  TextStyle? textStyle,
  TextAlign? textAlign = TextAlign.center,
  EdgeInsetsGeometry? textPadding,
  Color? backgroundColor,
  VoidCallback? onDismiss,
  TextDirection? textDirection,
  bool? dismissOtherMark,
  BoxConstraints? constraints,
  int? columnCount = 3,
  int? rowCount = 5,
  double? angle,
  bool softWrap = false,
}) {
  if (context == null) {
    _throwIfNoContext(_contextMap.values, 'showWatermark');
  }
  context ??= _contextMap.values.first;

  final _WaterMarkTheme theme = _WaterMarkTheme.of(context);
  textStyle ??= theme.textStyle;
  textAlign ??= theme.textAlign;
  backgroundColor ??= theme.backgroundColor;

  final List<Widget> widget = buildMarkList(msg,
      rowCount: rowCount,
      columnCount: columnCount,
      textAlign: textAlign,
      textStyle: textStyle,
      angle: angle,
      softWrap: softWrap);
  return showWaterMarkWidget(
    widget,
    isShowMsg: true,
    context: context,
    onDismiss: onDismiss,
    dismissOtherMark: dismissOtherMark,
    textDirection: textDirection,
  );
}

/// Show [widget] with wartermark.
WaterMarkFuture showWaterMarkWidget(
  dynamic widget, {
  bool isShowMsg = false,
  bool isCustom = false,
  BuildContext? context,
  VoidCallback? onDismiss,
  bool? dismissOtherMark,
  TextDirection? textDirection,
  bool? handleTouch,
  int? columnCount = 3,
  int? rowCount = 5,
  double? angle,
}) {
  if (context == null) {
    _throwIfNoContext(_contextMap.values, 'showWatermarkWidget');
  }
  context ??= _contextMap.values.first;
  final _WaterMarkTheme theme = _WaterMarkTheme.of(context);
  TextDirection direction = textDirection ?? theme.textDirection;

  handleTouch ??= theme.handleTouch;
  final OverlayEntry entry = OverlayEntry(builder: (BuildContext ctx) {
    return IgnorePointer(
      ignoring: !handleTouch!,
      child: isCustom
          ? widget
          : Directionality(
              textDirection: direction,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: isShowMsg
                      ? widget as List<Widget>
                      : buildMarkListWidget(
                          widget,
                          rowCount: rowCount,
                          columnCount: columnCount,
                          angle: angle,
                        ),
                ),
              ),
            ),
    );
  });

  dismissOtherMark ??= theme.dismissOtherOnShow;

  if (dismissOtherMark == true) {
    WaterMarkManager().dismissAll();
  }

  final WaterMarkFuture future = WaterMarkFuture._(
    entry,
    onDismiss,
  );

  WaterMarkManager().addFuture(future);

  void _insertOverlayEntry() {
    if (!future.dismissed) {
      future._insertEntry(context!);
    }
  }

  if (!context.debugDoingBuild && context.owner?.debugBuilding != true) {
    _insertOverlayEntry();
  } else {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _insertOverlayEntry();
    });
  }

  return future;
}

/// Show custom [widget] with wartermark.
WaterMarkFuture showWaterMarkCustom(
  Widget widget, {
  BuildContext? context,
  VoidCallback? onDismiss,
  bool? dismissOtherMark,
  bool? handleTouch,
}) {
  return showWaterMarkWidget(
    widget,
    isShowMsg: true,
    isCustom: true,
    context: context,
    onDismiss: onDismiss,
    dismissOtherMark: dismissOtherMark,
  );
}

void dismissAllMark({bool showAnim = false}) {
  WaterMarkManager().dismissAll(showAnim: showAnim);
}

void _throwIfNoContext(Iterable<BuildContext> contexts, String methodName) {
  if (contexts.isNotEmpty) {
    return;
  }
  final List<DiagnosticsNode> information = <DiagnosticsNode>[
    ErrorSummary('No WaterMark widget found.'),
    ErrorDescription(
      '$methodName requires an WaterMark widget ancestor '
      'for correct operation.',
    ),
    ErrorHint(
      'The most common way to add an WaterMark to an application '
      'is to wrap a WaterMark upon a WidgetsApp(MaterialApp/CupertinoApp).',
    ),
  ];
  throw FlutterError.fromParts(information);
}
