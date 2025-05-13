import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';
import 'package:readio/features/home/presentation/manager/top_books_cubit/fetch_top_books_cubit.dart';

class BookByCatigoryView extends StatelessWidget {
  final String category;

  const BookByCatigoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchTopBooksCubit(getIt.get<HomeRepo>())
                ..fetchTopBooks(category: category),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('$category Books'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: BookByCatigoryBody(),
      ),
    );
  }
}

class BookByCatigoryBody extends StatelessWidget {
  const BookByCatigoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTopBooksCubit, FetchTopBooksState>(
      builder: (context, state) {
        if (state is FetchTopBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchTopBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookByCatigoryItem(book: state.books[index]);
            },
          );
        } else if (state is FetchTopBooksFailure) {
          print('🔴 Error: ${state.errorMessage}');
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: Text('No books found'));
      },
    );
  }
}

class BookByCatigoryItem extends StatelessWidget {
  final BookEntity book;
  const BookByCatigoryItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Dynamically get the current theme
    final isLightTheme = theme.brightness == Brightness.light;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          context.push('/BookDetailsView', extra: book);
        },
        child: Container(
          height: 140, // Increased height for more spacious look
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color:
                theme
                    .scaffoldBackgroundColor, // Use theme's scaffold background
            borderRadius: BorderRadius.circular(12), // Smoother corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isLightTheme ? 0.05 : 0.2,
                ), // Softer shadow, theme-aware
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded image corners
                child: Image.network(
                  book.image ?? 'https://via.placeholder.com/80x100',
                  width: 70, // Reduced width
                  height: 90, // Reduced height
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Image.asset(
                        'assets/images/placeholder.jpg',
                        width: 70,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                ),
              ),
              const SizedBox(width: 12), // Adjusted spacing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.title ?? 'Unknown Title',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montaguSlab(
                        // Elegant font for title
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            theme
                                .textTheme
                                .bodyLarge
                                ?.color, // Theme's text color
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.author ?? 'Unknown Author',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montserratAlternates(
                        // Elegant font for author
                        fontSize: 14,
                        color:
                            theme
                                .textTheme
                                .bodyMedium
                                ?.color, // Theme's secondary text color
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          book.rating?.toString() ?? 'N/A',
                          style: GoogleFonts.montserratAlternates(
                            fontSize: 14,
                            color:
                                theme
                                    .textTheme
                                    .bodyLarge
                                    ?.color, // Theme's text color
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.star,
                          color:
                              isLightTheme
                                  ? Colors.amber
                                  : Colors
                                      .amberAccent, // Theme-aware star color
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
