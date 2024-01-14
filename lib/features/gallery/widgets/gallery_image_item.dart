import 'dart:io';

import 'package:flutter/material.dart';

class GalleryImageItem extends StatelessWidget {
  const GalleryImageItem({required this.image, required this.onTap, Key? key})
      : super(key: key);

  final File image;

  final void Function(File file) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(image),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.file(
          fit: BoxFit.fill,
          height: 80,
          width: 80,
          image,
        ),
      ),
    );
  }
}
