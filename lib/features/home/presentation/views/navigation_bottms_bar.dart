import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/home/presentation/views/community_view.dart';
import 'package:readio/features/home/presentation/views/home_view.dart';
import 'package:readio/features/search/presentation/views/search_view.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentView = 0;

  final List<Widget> screens = [HomeView(), SearchView(), CommunityView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LazyIndexedStack(index: currentView, children: screens),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsData.secondaryColor,
        selectedItemColor: ColorsData.bottomsColor,
        unselectedItemColor: ColorsData.textColor,
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
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
        ],
      ),
    );
  }
}
