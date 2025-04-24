import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readio/config/cache/cache_helper.dart';
import 'package:readio/features/Splash/presentaion/views/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
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
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale('en'), 

      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
