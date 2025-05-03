import 'package:flutter/material.dart';
import 'package:readio/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:readio/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  final List<String> categories = [
    'Drama',
    'Poetry',
    'Horror',
    'Psychology',
    'Fantasy',
  ];

  final List<String> bookCovers = [
    'assets/images/kite_runner.jpg',
    'assets/images/kite_runner.jpg',
    'assets/images/kite_runner.jpg',
    'assets/images/kite_runner.jpg',
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: HomeAppBar(),
      body: HomeBody(categories: categories, bookCovers: bookCovers),
    );
  }
}











