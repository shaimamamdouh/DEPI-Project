import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/books/presentation/views/widgets/custom_elevated_button.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

class BookDetailsBody extends StatelessWidget {
  final BookEntity book;

  const BookDetailsBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                book.image != null && book.image!.isNotEmpty
                    ? book.image!
                    : 'https://via.placeholder.com/150',
                width: MediaQuery.of(context).size.width * 0.5,
                height: 250,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/placeholder.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                book.title ?? 'Unknown Title',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorsData.textColor,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Center(
              child: Text(
                book.author ?? 'Unknown Author',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              book.description ?? 'No description available.',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (book.previewLink != null && book.previewLink!.isNotEmpty)
                  CustomElevatedButton(
                    text: 'Read',
                    icon: const Icon(Icons.book),
                    onPressed: () {
                      context.push(
                        '/ReadingView',
                        extra: book,
                      );
                    },
                  ),
                if (book.description != null && book.description!.isNotEmpty)
                  CustomElevatedButton(
                    text: 'Listen',
                    icon: const Icon(Icons.headset),
                    onPressed: () {
                      context.push(
                        '/ListeningBookView',
                        extra: book,
                      );
                    },
                  ),
                CustomElevatedButton(
                  text: 'Favorite',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    final favoritesBox = Hive.box<BookEntity>('favoritesBox');
                    final existing = favoritesBox.values.any((item) => item.title == book.title);

                    if (!existing) {
                      favoritesBox.add(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to favorites')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Already in favorites')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
