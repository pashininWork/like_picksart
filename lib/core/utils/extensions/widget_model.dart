import 'package:elementary/elementary.dart';
import 'package:like_picsart/generated/localization/app_localizations.dart';

extension WidgetModelExt on WidgetModel {
  AppLocalizations get locale {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    return AppLocalizations.of(context)!;
  }
}
