import 'package:bitmap/bitmap.dart';
import 'package:flutter/material.dart';

final class BitmapImageNotifier extends ChangeNotifier {
  BitmapImageNotifier(Bitmap image)
      : _initialImage = image,
        _image = image;

  /// Original image
  final Bitmap _initialImage;

  Bitmap get intialImage => _initialImage;

  Bitmap _image;

  Bitmap get image => _image;

  final _history = <Bitmap>[];

  Bitmap? _lastRemovedChange;

  /// Last removed [Bitmap] change of [image]
  Bitmap? get lastRemovedChange => _lastRemovedChange;

  /// Return [true] if [image] have changes
  bool get haveChanges => _history.isNotEmpty;

  /// Apply to [image] new [BitmapOperation] change
  void updateImage(BitmapOperation operation) {
    _history.add(_image);
    _image = _image.apply(operation);
    notifyListeners();
  }

  /// Undo last [image] changes
  void undoLastChange() {
    if (_history.isNotEmpty) {
      _lastRemovedChange = _image;
      _image = _history.removeLast();
      notifyListeners();
    }
  }

  /// Redo last [image] change
  void redoLastChange() {
    if (_lastRemovedChange != null) {
      _image = _lastRemovedChange!;
      _lastRemovedChange = null;
      notifyListeners();
    }
  }
}
