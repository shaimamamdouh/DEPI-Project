import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

class AudioBooksListView extends StatelessWidget {
  final List<BookEntity> bookCovers;

  const AudioBooksListView({super.key, required this.bookCovers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bookCovers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              context.push('/BookDetailsView', extra: bookCovers[index]);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                bookCovers[index].image ?? 'https://via.placeholder.com/150',
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
      },
    );
  }
}