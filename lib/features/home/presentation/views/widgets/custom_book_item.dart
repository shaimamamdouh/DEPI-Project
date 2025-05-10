
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/book_entity.dart';

class CustomBookItem extends StatelessWidget {
  final String image;
  final BookEntity book; 
  const CustomBookItem({super.key, required this.image, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/BookDetailsView', extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            image,
            width: 120,
            height: 180,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/placeholder.jpg',
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}