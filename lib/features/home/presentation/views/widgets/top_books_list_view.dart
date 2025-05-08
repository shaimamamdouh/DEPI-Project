import 'package:flutter/widgets.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_book_item.dart';

class TopBooksListView extends StatelessWidget {
  const TopBooksListView({super.key, required this.bookCovers});

  final List<BookEntity> bookCovers;
  

  @override
  Widget build(BuildContext context) {

     print('📚 Rendering ${bookCovers.length} books');

  for (var book in bookCovers) {
    print('🖼️ Book image: ${book.image}');
  }
    return ListView.builder(
      
      scrollDirection: Axis.horizontal,
      itemCount: bookCovers.length,
      itemBuilder: (context, index) {

        final imageUrl = bookCovers[index].image != null &&
            bookCovers[index].image!.isNotEmpty
            ? bookCovers[index].image!
            : 'https://via.placeholder.com/150'; // رابط placeholder أخف
        return CustomBookItem(
          image: bookCovers[index].image != null && bookCovers[index].image!.isNotEmpty
              ? bookCovers[index].image!
              : 'https://via.placeholder.com/150',
          book: bookCovers[index], // تمرير الـ book
        );
      },
    );
  }
}
