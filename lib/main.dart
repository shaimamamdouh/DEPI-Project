import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:readio/core/config/cache/cache_helper.dart';
import 'package:readio/core/utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('users');
  await Hive.openBox('books');
  await Hive.openBox('audiobooks');
  Hive.registerAdapter(BookEntityAdapter());

  WidgetsFlutterBinding.ensureInitialized(); //initialize the widgets binding
  await CacheHelper.init();
  await CacheHelper.setData(key: 'name', value: "ahmed");
  CacheHelper.getData(key: 'name');
  print(CacheHelper.getData(key: 'name'));
  await CacheHelper.removeData(key: 'name');
  print(CacheHelper.getData(key: 'name'));
  runApp(const Readio());
}

class Readio extends StatelessWidget {
  const Readio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale('en'), // Default locale

      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
