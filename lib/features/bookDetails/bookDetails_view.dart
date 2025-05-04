import 'package:flutter/material.dart';
import 'package:readio/features/bookDetails/bookDetails_custom.dart';
import 'package:readio/features/bookDetails/readingBook.dart'; // صفحة القراءة
import 'package:readio/features/bookDetails/listeningBook.dart'; // صفحة الاستماع

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: const Color(0xFFFEF6E3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              Center(
                child: Image.asset(
                  book.imagePath,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),

              Center(
                child: Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),


              Text(
                'Author:',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.author,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),


              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // التنقل إلى صفحة ReadingBook
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadingBook(book: book),
                        ),
                      );
                    },
                    icon: const Icon(Icons.book),
                    label: const Text('Read'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF392626),
                      foregroundColor: const Color(0xFFFEF6E3),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListeningPage(book: book),
                        ),
                      );
                    },
                    icon: const Icon(Icons.headset),
                    label: const Text('Listen'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF392626),
                      foregroundColor: const Color(0xFFFEF6E3),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    label: const Text('Favorite'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF392626),
                      foregroundColor: const Color(0xFFFEF6E3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
