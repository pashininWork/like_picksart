import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Repository for working with file system
abstract interface class IStorageRepository {
  /// Save image with unique name to [getApplicationDocumentsDirectory()] directory
  Future<void> saveImage(List<int> bytes);

  /// Get path of images ending at .jpg && .png
  Future<List<String>> getPathOfAllImages();

  /// [Stream] notifying about new files in directory
  Stream<File> get storageChangesStream;
}

class StorageRepository implements IStorageRepository {
  final _applicationDir = getApplicationDocumentsDirectory();

  @override
  Stream<File> get storageChangesStream => _streamController.stream;

  final _streamController = StreamController<File>.broadcast();

  @override
  Future<List<String>> getPathOfAllImages() async {
    final dir = await _applicationDir;
    final images = dir.listSync().where((element) =>
        element.path.endsWith('.jpg') || element.path.endsWith('.png'));
    return images.map((e) => e.path).toList();
  }

  @override
  Future<void> saveImage(List<int> bytes) async {
    final path = (await _applicationDir).path;

    final file = File('$path/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await file.create();
    await file.writeAsBytes(bytes);
    _streamController.add(file);
  }
}
