import 'package:flutter/material.dart';
import 'package:readio/features/books/presentation/views/widgets/book_details_body.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity book; // استقبال الـ book

  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          book.title ?? 'Book Details',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: BookDetailsBody(book: book), // تمرير الـ book للـ body
    );
  }
}
