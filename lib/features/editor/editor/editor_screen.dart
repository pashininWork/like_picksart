import 'package:auto_route/auto_route.dart';
import 'package:bitmap/bitmap.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:like_picsart/core/router/app_router.gr.dart';

import 'package:like_picsart/core/utils/extensions/widget_model.dart';
import 'package:like_picsart/features/editor/editor/notifiers/bitmap_notifier.dart';
import 'package:like_picsart/features/editor/editor/widgets/editor_nav_bar.dart';

part 'editor_wm.dart';
part 'editor_model.dart';

@RoutePage()
class EditorScreen extends ElementaryWidget<EditorWM> {
  const EditorScreen({
    required this.image,
    super.key,
  }) : super(createEditorWM);

  final Bitmap image;

  @override
  Widget build(EditorWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
            listenable: wm.imageNotifier,
            builder: (_, __) {
              return Row(
                children: [
                  IconButton(
                    onPressed: wm.haveChanges ? wm.undoLastChange : null,
                    icon: const Icon(Icons.undo),
                  ),
                  IconButton(
                    onPressed:
                        wm.lastRemovedChange != null ? wm.redoLastChange : null,
                    icon: const Icon(Icons.redo),
                  ),
                ],
              );
            }),
        actions: [
          TextButton(
            onPressed: wm.nextButtonOnTap,
            child: Text(wm.locale.next),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: wm.imageNotifier,
        builder: (_, __) => InteractiveViewer(
          child: Center(
            child: Image.memory(
              wm.image.buildHeaded(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: EditorNavBar(editorWM: wm),
    );
  }
}
