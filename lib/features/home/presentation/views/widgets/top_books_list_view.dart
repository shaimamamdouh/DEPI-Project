import 'package:flutter/widgets.dart';
import 'package:readio/domain/entities/book_entity.dart';
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

        return CustomBookItem(
          image:
              (bookCovers[index].image.isNotEmpty == true)
                  ? bookCovers[index].image
                  : 'https://archive.org/download/placeholder-image/placeholder-image.jpg',
        );
      },
    );
  }
}
