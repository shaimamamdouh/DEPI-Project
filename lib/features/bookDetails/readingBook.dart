import 'package:flutter/material.dart';
import 'package:readio/features/bookDetails/bookDetails_custom.dart';

class ReadingBook extends StatelessWidget {
  final Book book;

  const ReadingBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: const Color(0xFFFEF6E3),
      ),
      body: Center(
        child: Text("Start reading ${book.title} here!"),

      ),
    );
  }
}
