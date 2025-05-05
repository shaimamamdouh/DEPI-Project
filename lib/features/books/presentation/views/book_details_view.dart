import 'package:flutter/material.dart';
import 'package:readio/features/books/presentation/views/widgets/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Kite Runner'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: BookDetailsBody(),
    );
  }
}


