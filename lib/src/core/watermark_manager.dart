import 'water_mark.dart';

class WaterMarkManager {
  factory WaterMarkManager() => _instance;

  WaterMarkManager._();

  static late final WaterMarkManager _instance = WaterMarkManager._();

  final Set<WaterMarkFuture> markSet = <WaterMarkFuture>{};

  void dismissAll({bool showAnim = false}) {
    markSet.toList().forEach((WaterMarkFuture v) {
      v.dismiss(showAnim: showAnim);
    });
  }

  void removeFuture(WaterMarkFuture future) {
    markSet.remove(future);
  }

  void addFuture(WaterMarkFuture future) {
    markSet.add(future);
  }
}
