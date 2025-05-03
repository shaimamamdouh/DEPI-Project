import 'package:flutter/material.dart';
import 'package:readio/features/search/presentation/views/search_view.dart';
import 'package:readio/features/profile/presentation/views/profile_view.dart';
import 'package:readio/features/notification/presentation/views/notification_view.dart';
import 'package:readio/features/setting/presentation/views/setting_view.dart';
import 'package:readio/features/categories/Drama.dart';

import '../../../bookDetails/bookDetails_view.dart';
import 'text_home custom.dart';
import 'botton_navigation_bar_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF392626),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              elevation: 20,
              selectedItemColor: const Color(0xFFFEF6E3),
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                CustomBottom(labelText: "Home", icon: const Icon(Icons.home)).item,
                CustomBottom(labelText: "Search", icon: const Icon(Icons.search)).item,
                CustomBottom(labelText: "Notifications", icon: const Icon(Icons.notifications)).item,
                CustomBottom(labelText: "Settings", icon: const Icon(Icons.settings)).item,
              ],
              onTap: (index) {
                if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchView()));
                } else if (index == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                } else if (index == 3) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                }
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserProfileView(
                              userName: 'Username',
                              userImagePath: 'assets/images/user.png',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Hi, UserName",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF392626),
                            ),
                          ),
                          Image.asset(
                            'assets/images/logo2.jpg',
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              text(headtext: 'Browse Categories'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  categoryChip(context, "Drama", DramaPage()), // ربط قسم Drama
                ],
              ),
              const SizedBox(height: 50),
              text(headtext: 'Suggestions'),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildBookCard("assets/images/book1.jpg", "Arss"),
                    buildBookCard("assets/images/book1.jpg", "It Ends with Us"),
                    buildBookCard("assets/images/book1.jpg", "A Court of Thorns aRoses"),
                    buildBookCard("assets/images/book1.jpg", "The Guest List"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget categoryChip(BuildContext context, String name, Widget page) {
    return ActionChip(
      label: Text(name),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  static Widget buildBookCard(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 100,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
