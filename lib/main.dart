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
import 'package:readio/features/home/domain/repository/home_repo.dart';
import 'package:readio/features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:readio/features/theme/app_theme.dart';
import 'package:readio/features/theme/manager/cubit/theme_cubit.dart';

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
  await Hive.openBox<BookEntity>('favoritesBox');

  setupServiceLocator();

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
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignupCubit()),
        BlocProvider(create: (_) => ResetPasswordCubit()),
        BlocProvider(create: (context) => SearchCubit(getIt.get<HomeRepo>())),
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp.router(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeCubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('ar')],
            locale: const Locale('en'),
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            routerConfig: Routes.router,
          );
        },
      ),
    );
  }
}
