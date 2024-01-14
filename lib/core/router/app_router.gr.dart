// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:bitmap/bitmap.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:like_picsart/features/editor/before_after/before_after_screen.dart'
    as _i1;
import 'package:like_picsart/features/editor/editor/editor_screen.dart' as _i2;
import 'package:like_picsart/features/gallery/gallery_screen.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BeforeAfterRoute.name: (routeData) {
      final args = routeData.argsAs<BeforeAfterRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BeforeAfterScreen(
          beforeImage: args.beforeImage,
          afterImage: args.afterImage,
          key: args.key,
        ),
      );
    },
    EditorRoute.name: (routeData) {
      final args = routeData.argsAs<EditorRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EditorScreen(
          image: args.image,
          key: args.key,
        ),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GalleryScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BeforeAfterScreen]
class BeforeAfterRoute extends _i4.PageRouteInfo<BeforeAfterRouteArgs> {
  BeforeAfterRoute({
    required _i5.Bitmap beforeImage,
    required _i5.Bitmap afterImage,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          BeforeAfterRoute.name,
          args: BeforeAfterRouteArgs(
            beforeImage: beforeImage,
            afterImage: afterImage,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BeforeAfterRoute';

  static const _i4.PageInfo<BeforeAfterRouteArgs> page =
      _i4.PageInfo<BeforeAfterRouteArgs>(name);
}

class BeforeAfterRouteArgs {
  const BeforeAfterRouteArgs({
    required this.beforeImage,
    required this.afterImage,
    this.key,
  });

  final _i5.Bitmap beforeImage;

  final _i5.Bitmap afterImage;

  final _i6.Key? key;

  @override
  String toString() {
    return 'BeforeAfterRouteArgs{beforeImage: $beforeImage, afterImage: $afterImage, key: $key}';
  }
}

/// generated route for
/// [_i2.EditorScreen]
class EditorRoute extends _i4.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({
    required _i5.Bitmap image,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EditorRoute.name,
          args: EditorRouteArgs(
            image: image,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditorRoute';

  static const _i4.PageInfo<EditorRouteArgs> page =
      _i4.PageInfo<EditorRouteArgs>(name);
}

class EditorRouteArgs {
  const EditorRouteArgs({
    required this.image,
    this.key,
  });

  final _i5.Bitmap image;

  final _i6.Key? key;

  @override
  String toString() {
    return 'EditorRouteArgs{image: $image, key: $key}';
  }
}

/// generated route for
/// [_i3.GalleryScreen]
class GalleryRoute extends _i4.PageRouteInfo<void> {
  const GalleryRoute({List<_i4.PageRouteInfo>? children})
      : super(
          GalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
