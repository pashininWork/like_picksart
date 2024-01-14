part of 'before_after_screen.dart';

/// Function used in [BeforeAfterScreen] for create [BeforeAfterWM]
BeforeAfterWM createBeforeAfterWM(BuildContext context) {
  return BeforeAfterWM(
    BeforeAfterModel(
      repository: context.read<IStorageRepository>(),
    ),
  );
}

class BeforeAfterWM extends WidgetModel<BeforeAfterScreen, BeforeAfterModel> {
  BeforeAfterWM(super.model);

  /// Save [Bitmap] into device storage
  Future<void> saveImage(Bitmap bitmap) async {
    model.saveImage(bitmap);
    context.router.navigate(const GalleryRoute());
  }
}
