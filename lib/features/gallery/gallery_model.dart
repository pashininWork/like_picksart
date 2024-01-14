part of 'gallery_screen.dart';

class GalleryModel extends ElementaryModel {
  GalleryModel({super.errorHandler, required IStorageRepository repository})
      : _repository = repository;

  final IStorageRepository _repository;

  Future<List<String>> getPathsOfImages() async {
    return await _repository.getPathOfAllImages();
  }

  Stream<File> getStorageStream() {
    return _repository.storageChangesStream;
  }
}
