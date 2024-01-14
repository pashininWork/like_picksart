import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bitmap/bitmap.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_picsart/core/repository/storage_repo.dart';
import 'package:like_picsart/core/router/app_router.gr.dart';
import 'package:like_picsart/core/utils/extensions/widget_model.dart';
import 'package:like_picsart/features/gallery/widgets/gallery_empty_item.dart';
import 'package:like_picsart/features/gallery/widgets/gallery_image_item.dart';
import 'package:like_picsart/features/gallery/widgets/image_source_dialog.dart';
import 'package:provider/provider.dart';

part 'gallery_wm.dart';
part 'gallery_model.dart';

@RoutePage()
class GalleryScreen extends ElementaryWidget<GalleryWM> {
  const GalleryScreen({super.key}) : super(createGalleryWM);

  @override
  Widget build(GalleryWM wm) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(wm.locale.gallery),
      ),
      body: EntityStateNotifierBuilder(
        listenableEntityState: wm.images,
        loadingBuilder: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (_, images) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 10,
            runSpacing: 15,
            children: [
              GalleryEmptyItem(onTap: wm.emptyItemOnTap),
              ...images!
                  .map((path) => GalleryImageItem(
                        image: File(path),
                        onTap: wm.imageItemOnTap,
                      ))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
