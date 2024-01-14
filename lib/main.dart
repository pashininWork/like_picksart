import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:like_picsart/core/repository/storage_repo.dart';
import 'package:like_picsart/core/router/app_router.dart';
import 'package:like_picsart/generated/localization/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Router of entire App
  static final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Provider<IStorageRepository>(
      create: (context) => StorageRepository(),
      child: MaterialApp.router(
        routerConfig: _router.config(),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
