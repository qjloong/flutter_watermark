part of 'water_mark.dart';

/// Use the [dismiss] to dismiss toast.
class WaterMarkFuture {
  WaterMarkFuture._(
    this._entry,
    this._onDismiss,
  ) {
    _entry.addListener(_mountedListener);
  }

  final OverlayEntry _entry;
  final VoidCallback? _onDismiss;

  bool _isShow = false;
  bool _dismissed = false;
  bool _isEntryInserted = false;

  bool get mounted => _isShow;

  bool get dismissed => _dismissed;

  void _mountedListener() {
    _isShow = _entry.mounted;
  }

  void _insertEntry(BuildContext context) {
    final OverlayState? state = Overlay.of(context);
    _isEntryInserted = state != null;
    state?.insert(_entry);
  }

  void _removeEntry() {
    _entry.removeListener(_mountedListener);
    if (_isEntryInserted) {
      _entry.remove();
    }
  }

  Future dismiss({bool showAnim = false}) {
    if (_isShow) {
      _isShow = false;
      _onDismiss?.call();
    }

    WaterMarkManager().removeFuture(this);
    _removeEntry();
    _dismissed = true;
    return Future.value(null);
  }
}
