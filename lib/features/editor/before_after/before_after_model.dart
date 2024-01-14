part of 'before_after_screen.dart';

class BeforeAfterModel extends ElementaryModel {
  BeforeAfterModel({required IStorageRepository repository, super.errorHandler})
      : _repository = repository;

  final IStorageRepository _repository;

  Future<void> saveImage(Bitmap bitmap) async {
    await _repository.saveImage(bitmap.buildHeaded());
  }
}
