import 'package:flutter/widgets.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_book_item.dart';

class YourBooksListView extends StatelessWidget {
  const YourBooksListView({
    super.key,
    required this.bookCovers,
  });

  final List<String> bookCovers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bookCovers.length,
      itemBuilder: (context, index) {
        return CustomBookItem(image: bookCovers[index]);
      },
    );
  }
}