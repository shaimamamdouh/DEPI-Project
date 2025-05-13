import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/features/Splash/presentaion/views/splash_view.dart';
import 'package:readio/features/authentication/presentation/views/login_view.dart';
import 'package:readio/features/books/presentation/views/favourite_books_view.dart';
import 'package:readio/features/search/presentation/views/search_view.dart';
import 'package:readio/features/home/presentation/views/user_profile_view.dart';
import 'package:readio/features/authentication/presentation/views/signup_view.dart';
import 'package:readio/features/authentication/presentation/views/start_view.dart';
import 'package:readio/features/books/presentation/views/book_by_catigory_view.dart';
import 'package:readio/features/books/presentation/views/book_details_view.dart';
import 'package:readio/features/books/presentation/views/listening_book_view.dart';
import 'package:readio/features/books/presentation/views/reading_book_view.dart';
import 'package:readio/features/home/presentation/views/home_view.dart';
import 'package:readio/features/home/presentation/views/navigation_bottms_bar.dart';

import '../../features/chatbot/views/book_chat_bot_view.dart';
import '../../features/home/data/models/book_model/reading_view.dart';
import '../../features/home/domain/entities/book_entity.dart';

abstract class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),

      GoRoute(
        path: '/StartView',
        builder: (context, state) => FirebaseAuth.instance.currentUser == null ? const StartView() :  NavigationBottomBar(),
      ),
      GoRoute(
        path: '/SignupView',
        builder: (context, state) =>  SignupView(),
      ),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) =>  LoginView(),
      ),
      GoRoute(
        path: '/UserProfileView',
        builder: (context, state) => const UserProfileView(),
      ),
      // GoRoute(
      //   path: '/SendCodeView',
      //   builder: (context, state) => const SendCodeView(),
      // ),
      GoRoute(path: '/HomeView', builder: (context, state) => HomeView()),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/SearchView',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/NavigationBottomBar',
        builder: (context, state) => const NavigationBottomBar(),
      ),
  GoRoute(
        path: '/BookByCatigoryView',
        builder: (context, state) {
          final category = state.extra as String; // استقبال اسم الكاتيجوري
          return BookByCatigoryView(category: category);
        },
      ),
      GoRoute(
        path: '/ReadingBookView',
        builder: (context, state) => const ReadingBookView(),
      ),
      GoRoute(
        path: '/ListeningBookView',
        builder: (context, state) {
          final book = state.extra as BookEntity?;
          return ListeningBookView(book: book);
        },
      ),
      GoRoute(
        path: '/BookDetailsView',
        builder: (context, state) {
          final book = state.extra as BookEntity;
          return BookDetailsView(book: book);
        },
      ),
      GoRoute(
        path: '/ReadingView',
        builder: (context, state) {
          final book = state.extra as BookEntity?;
          return ReadingView(book: book);
        },
      ),

  GoRoute(
        path: '/FavoriteBooksView',
        builder: (context, state) => const FavoriteBooksView(),
      ),
      GoRoute(
        path: '/BookChatBotView',
        builder: (context, state) => const BookChatBotView(),
      ),



      
    ],
  );
}
