import 'package:flutter/widgets.dart';

class RecommendedBooksListView extends StatelessWidget {
  const RecommendedBooksListView({super.key, required this.bookCovers});

  final List<String> bookCovers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bookCovers.length,
      itemBuilder: (context, index) {
        return null;
      
       // return CustomBookItem(image: bookCovers[index]);
      },
    );
  }
}
