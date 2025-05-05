import 'package:flutter/widgets.dart';
import 'package:readio/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_main_text.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_paner.dart';
import 'package:readio/features/home/presentation/views/widgets/recommended_books_list_view.dart';
import 'package:readio/features/home/presentation/views/widgets/top_books_list_view.dart';
import 'package:readio/features/home/presentation/views/widgets/your_books_list_view.dart';
import 'package:readio/core/utils/catagory_book_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.bookCovers,
    required List<String> categories,
  });

  final List<String> bookCovers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaner(),
            SizedBox(height: 24),
            CustomMainText(text: 'Check Categories:'),
            SizedBox(height: 12),
            SizedBox(
              height: 70,
              child: CategoriesListView(categories: categories),
            ),
            SizedBox(height: 24),
            CustomMainText(text: 'Top picks for you:'),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: TopBooksListView(bookCovers: bookCovers),
            ),
            SizedBox(height: 24),
            CustomMainText(text: 'Your books:'),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: YourBooksListView(bookCovers: bookCovers),
            ),
            SizedBox(height: 24),
            CustomMainText(text: 'Recommended for you:'),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: RecommendedBooksListView(bookCovers: bookCovers),
            ),
          ],
        ),
      ),
    );
  }
}
