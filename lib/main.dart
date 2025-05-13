import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:readio/core/utils/bloc_observer.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/core/utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:readio/features/authentication/manager/cubits/login_cubit/login_cubit.dart';
import 'package:readio/features/authentication/manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:readio/features/authentication/manager/cubits/signup_cubit/signup_cubit.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/core/config/cache/cache_helper.dart';
import 'package:readio/features/books/presentation/views/text_to_speech_helper.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';
import 'package:readio/features/search/search_cubit.dart';
//import 'package:readio/core/utils/colors_data.dart';

import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تهيئة الـ widgets binding
  await Firebase.initializeApp(); // تهيئة Firebase
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('***User is currently signed out!');
    } else {
      print('****User is signed in!');
    }
  });

  // تهيئة Hive
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('users');
  await Hive.openBox<BookEntity>('Topbooks');
  await Hive.openBox<BookEntity>('audiobooks');
  await Hive.openBox<BookEntity>('favoritesBox');

  // تهيئة CacheHelper
  await CacheHelper.init();

  // تهيئة TextToSpeechHelper مع التعامل مع الأخطاء
  try {
    await TextToSpeechHelper.init();
    print('TextToSpeechHelper initialized successfully');
  } catch (e) {
    print('Error initializing TextToSpeechHelper: $e');
  }

  // تهيئة GetIt
  setupServiceLocator();

  // تهيئة Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  runApp(const Readio());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class Readio extends StatelessWidget {
  const Readio({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => SearchCubit(getIt.get<HomeRepo>())),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: const Locale('en'),
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsData.primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorsData.primaryColor,
            iconTheme: IconThemeData(color: ColorsData.textColor),
            titleTextStyle: TextStyle(
              color: ColorsData.textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsData.bottomsColor,
              foregroundColor: ColorsData.primaryColor,
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: ColorsData.textColor),
          ),
        ),
      ),
    );
  }
}