import 'package:flutter/material.dart';
import 'package:like_picsart/generated/localization/app_localizations.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  AppLocalizations get locale {
    return AppLocalizations.of(this)!;
  }
}
