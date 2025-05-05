import 'package:go_router/go_router.dart';
import 'package:readio/features/Splash/presentaion/views/splash_view.dart';
import 'package:readio/features/authentication/presentation/views/forgot_password_view.dart';
import 'package:readio/features/authentication/presentation/views/login_view.dart';
import 'package:readio/features/authentication/presentation/views/send_code_view.dart';
import 'package:readio/features/authentication/presentation/views/start_view.dart';
import 'package:readio/features/books/presentation/views/book_by_catigory_view.dart';
import 'package:readio/features/books/presentation/views/book_details_view.dart';
import 'package:readio/features/books/presentation/views/listening_book_view.dart';
import 'package:readio/features/books/presentation/views/reading_book_view.dart';
import 'package:readio/features/home/presentation/views/home_view.dart';
import 'package:readio/features/home/presentation/views/navigation_bottms_bar.dart';
import 'package:readio/features/search/presentation/views/search_view.dart';

abstract class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),

      GoRoute(
        path: '/StartView',
        builder: (context, state) => const StartView(),
      ),
      GoRoute(
        path: '/SignupView',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/ForgotPasswordView',
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: '/SendCodeView',
        builder: (context, state) => const SendCodeView(),
      ),
      GoRoute(path: '/HomeView', builder: (context, state) => HomeView()),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/NavigationBottomBar',
        builder: (context, state) => const NavigationBottomBar(),
      ),
      GoRoute(
        path: '/BookByCatigoryView',
        builder: (context, state) => const BookByCatigoryView(),
      ),
      GoRoute(
        path: '/ReadingBookView',
        builder: (context, state) => const ReadingBookView(),
      ),
      GoRoute(
        path: '/ListeningBookView',
        builder: (context, state) => const ListeningBookView(),
      ),
      GoRoute(
        path: '/BookDetailsView',
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
