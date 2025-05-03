import 'package:flutter/material.dart';
import 'package:readio/features/bookDetails/bookDetails_view.dart';
import 'package:readio/features/bookDetails/bookDetails_custom.dart'; // مسار الكلاس الجديد

class DramaPage extends StatelessWidget {
  const DramaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final book = Book(
      title: 'Drama Book Title',
      author: 'John Smith',
      description:
      'A captivating drama that explores human emotions, relationships, and the complexities of life. This book takes readers on a heartfelt journey through love, loss, and redemption.',
      imagePath: 'assets/images/book1.jpg',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        title: const Text('Drama'),
        backgroundColor: const Color(0xFFFEF6E3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailPage(book: book),
                    ),
                  );
                },
                child: Image.asset(
                  book.imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
