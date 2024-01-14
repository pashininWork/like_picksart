import 'package:bitmap/bitmap.dart';
import 'package:flutter/material.dart';
import 'package:like_picsart/core/utils/extensions/build_context.dart';

class BeforeAfterItem extends StatelessWidget {
  const BeforeAfterItem({required this.title, required this.image, Key? key})
      : super(key: key);

  final String title;

  final Bitmap image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.theme.textTheme.bodyLarge,
        ),
        Image.memory(
          fit: BoxFit.fill,
          height: 200,
          width: 200,
          image.buildHeaded(),
        ),
      ],
    );
  }
}
