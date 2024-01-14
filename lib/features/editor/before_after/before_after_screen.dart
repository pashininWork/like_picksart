import 'package:auto_route/auto_route.dart';
import 'package:bitmap/bitmap.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:like_picsart/core/repository/storage_repo.dart';
import 'package:like_picsart/core/router/app_router.gr.dart';
import 'package:like_picsart/core/utils/extensions/widget_model.dart';
import 'package:like_picsart/features/editor/before_after/widgets/before_after_item.dart';
import 'package:provider/provider.dart';

part 'before_after_wm.dart';
part 'before_after_model.dart';

@RoutePage()
class BeforeAfterScreen extends ElementaryWidget<BeforeAfterWM> {
  const BeforeAfterScreen({
    required this.beforeImage,
    required this.afterImage,
    super.key,
  }) : super(createBeforeAfterWM);

  final Bitmap beforeImage;

  final Bitmap afterImage;

  @override
  Widget build(BeforeAfterWM wm) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(wm.locale.beforeAfter),
        actions: [
          TextButton(
              onPressed: () => wm.saveImage(afterImage),
              child: Text(wm.locale.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: BeforeAfterItem(
                title: wm.locale.before,
                image: beforeImage,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: BeforeAfterItem(
                title: wm.locale.after,
                image: afterImage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
