import 'package:flutter/material.dart';

class GalleryEmptyItem extends StatelessWidget {
  const GalleryEmptyItem({required this.onTap, Key? key}) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: const SizedBox(
          height: 80,
          width: 80,
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
