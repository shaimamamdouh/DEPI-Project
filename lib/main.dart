import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:readio/core/utils/bloc_observer.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/core/utils/routes.dart';
import 'package:flu tter_localizations/flutter_localizations.dart';
import 'package:readio/features/authentication/manager/cubits/login_cubit/login_cubit.dart';
import 'package:readio/features/authentication/manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:readio/features/authentication/manager/cubits/signup_cubit/signup_cubit.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //initialize the widgets binding
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('***User is currently signed out!');
    } else {
      print('****User is signed in!');
    }
  });
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('users');
  await Hive.openBox<BookEntity>('Topbooks');
  await Hive.openBox<BookEntity>('audiobooks');

  locatorService();

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
        // BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
      ],
      child: MaterialApp.router(
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
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
      ),
    );
  }
}
