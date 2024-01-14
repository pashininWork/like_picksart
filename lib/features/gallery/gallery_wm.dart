part of 'gallery_screen.dart';

/// Function used in [GalleryScreen] for create [GalleryWM]
GalleryWM createGalleryWM(BuildContext context) {
  return GalleryWM(
    GalleryModel(
      repository: context.read<IStorageRepository>(),
    ),
  );
}

class GalleryWM extends WidgetModel<GalleryScreen, GalleryModel> {
  GalleryWM(super.model);

  final _images = EntityStateNotifier<List<String>>();

  /// Saved images in device storage
  ListenableState<EntityState<List<String>>> get images => _images;

  StreamSubscription? _sub;

  /// Choose image from gallery/camera then open it in [EditorScreen]
  Future<void> emptyItemOnTap() async {
    final imageSource = await showImageSourceDialog(context);

    if (imageSource != null) {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null && context.mounted) {
        await context.router.push(
          EditorRoute(
            image: await Bitmap.fromProvider(
              FileImage(
                File(image.path),
              ),
            ),
          ),
        );
      }
    }
  }

  /// Open [File] in [EditorScreen]
  Future<void> imageItemOnTap(File file) async {
    await context.router.push(
      EditorRoute(
        image: await Bitmap.fromProvider(
          FileImage(file),
        ),
      ),
    );
  }

  /// Loading images from storage
  Future<void> _loadImages() async {
    _images.loading();

    final paths = await model.getPathsOfImages();
    _images.content(paths);
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadImages();
    _sub = model.getStorageStream().listen((_) => _loadImages());
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }
}
