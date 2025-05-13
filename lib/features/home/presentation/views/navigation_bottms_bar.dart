import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/books/presentation/views/favourite_books_view.dart';
import 'package:readio/features/home/presentation/views/home_view.dart';
import 'package:readio/features/profile/presentation/views/profile_view.dart';
import 'package:readio/features/search/presentation/views/search_view.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentView = 0;

  final List<Widget> screens = [
    HomeView(),
    SearchView(),
    FavoriteBooksView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Dynamically get the current theme

    return Scaffold(
      backgroundColor:
          theme.scaffoldBackgroundColor, // Use theme's scaffold background
      body: SafeArea(
        child: LazyIndexedStack(index: currentView, children: screens),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            theme.appBarTheme.backgroundColor, // Use theme's app bar background
        selectedItemColor:
            theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
            ColorsData.bottomsColor, // Use theme's button background
        unselectedItemColor:
            theme.textTheme.bodyLarge?.color ??
            ColorsData.textColor, // Use theme's text color
        elevation: 10,
        currentIndex: currentView,
        onTap: (value) {
          setState(() {
            currentView = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
