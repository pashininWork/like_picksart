import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_picsart/core/utils/extensions/build_context.dart';

Future<ImageSource?> showImageSourceDialog(
  BuildContext context,
) async {
  return showDialog(
    context: context,
    builder: (_) => const _ImageSourceDialog(),
  );
}

class _ImageSourceDialog extends StatefulWidget {
  const _ImageSourceDialog({Key? key}) : super(key: key);

  @override
  State<_ImageSourceDialog> createState() => _ImageSourceDialogState();
}

class _ImageSourceDialogState extends State<_ImageSourceDialog> {
  ImageSource _groupValue = ImageSource.gallery;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.locale.galeryOrCamera),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            value: ImageSource.gallery,
            title: Text(context.locale.gallery),
            groupValue: _groupValue,
            onChanged: (newValue) => setState(() {
              _groupValue = newValue!;
            }),
          ),
          RadioListTile(
            value: ImageSource.camera,
            title: Text(context.locale.camera),
            groupValue: _groupValue,
            onChanged: (newValue) => setState(() {
              _groupValue = newValue!;
            }),
          )
        ],
      ),
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(context.locale.cancel)),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () => Navigator.pop(context, _groupValue),
            child: Text(context.locale.ok))
      ],
    );
  }
}
