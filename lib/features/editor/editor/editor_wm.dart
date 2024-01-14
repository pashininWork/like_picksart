part of 'editor_screen.dart';

/// Function used in [EditorScreen] for create [EditorWM]
EditorWM createEditorWM(BuildContext context) {
  return EditorWM(EditorModel());
}

/// [WidgetModel] for [EditorScreen]
class EditorWM extends WidgetModel<EditorScreen, EditorModel> {
  EditorWM(super.model);

  /// Get value in [initWidgetModel()]
  late final BitmapImageNotifier _imageNotifier;

  /// [ChangeNotifier] control [Bitmap] image and change history
  Listenable get imageNotifier => _imageNotifier;

  Bitmap get image => _imageNotifier.image;

  /// Last removed [Bitmap] change of [image]
  Bitmap? get lastRemovedChange => _imageNotifier.lastRemovedChange;

  /// Return [true] if [image] have changes
  bool get haveChanges => _imageNotifier.haveChanges;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _imageNotifier = BitmapImageNotifier(widget.image);
  }

  /// Go to [BeforeAfterScreen]
  Future<void> nextButtonOnTap() async {
    await context.router.push(
      BeforeAfterRoute(
        beforeImage: _imageNotifier.intialImage,
        afterImage: _imageNotifier.image,
      ),
    );
  }

  /// Undo last change
  void undoLastChange() {
    _imageNotifier.undoLastChange();
  }

  /// Redo last change
  void redoLastChange() {
    _imageNotifier.redoLastChange();
  }

  /// Rotate counterclockwise
  void rotateImageCounterClockWise() {
    _imageNotifier.updateImage(BitmapRotate.rotateCounterClockwise());
  }

  /// Rotate counter
  void rotateImageCounter() {
    _imageNotifier.updateImage(BitmapRotate.rotateClockwise());
  }

  /// Set brightness
  void setImageBrightness() {
    _imageNotifier.updateImage(BitmapBrightness(0.1));
  }

  /// Set contrast
  void setImageContrast() {
    _imageNotifier.updateImage(BitmapContrast(1.2));
  }
}
