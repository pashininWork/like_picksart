import 'package:flutter/material.dart';
import 'package:like_picsart/core/utils/extensions/widget_model.dart';
import 'package:like_picsart/features/editor/editor/editor_screen.dart';

class EditorNavBar extends StatelessWidget {
  const EditorNavBar({
    required this.editorWM,
    super.key,
  });

  final EditorWM editorWM;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(children: [
        IconButton(
          onPressed: editorWM.rotateImageCounterClockWise,
          icon: const Icon(
            Icons.rotate_left,
          ),
        ),
        IconButton(
          onPressed: editorWM.rotateImageCounter,
          icon: const Icon(
            Icons.rotate_right,
          ),
        ),
        TextButton(
          onPressed: editorWM.setImageBrightness,
          child: Text(editorWM.locale.brightness),
        ),
        TextButton(
          onPressed: editorWM.setImageContrast,
          child: Text(editorWM.locale.contrast),
        ),
      ]),
    );
  }
}
