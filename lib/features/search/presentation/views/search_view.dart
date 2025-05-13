import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/search/presentation/manger/cubit/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF392626),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for books...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFFEF6E3),
                  ),
                  suffixIcon:
                      _searchController.text.isNotEmpty
                          ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Color(0xFFFEF6E3),
                            ),
                            onPressed: () {
                              _searchController.clear();
                              context.read<SearchCubit>().searchBooks('');
                              setState(() {});
                            },
                          )
                          : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  filled: true,
                  fillColor: const Color(0xFF392626),
                ),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    if (context.mounted) {
                      print('🔍 Searching for: $value');
                      context.read<SearchCubit>().searchBooks(value);
                    }
                  });
                  setState(() {});
                },
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF392626),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    print('📚 Search results: ${state.books.length} books');
                    if (state.books.isEmpty) {
                      return const Center(
                        child: Text(
                          'No books found. Try another search term.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        final book = state.books[index];
                        return BookSearchResult(
                          book: book,
                          onTap: () {
                            print('Navigating to BookDetails: ${book.title}');
                            GoRouter.of(
                              context,
                            ).push('/BookDetailsView', extra: book);
                          },
                        );
                      },
                    );
                  } else if (state is SearchFailure) {
                    print('❌ Search error: ${state.error}');
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Error: ${state.error}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              context.read<SearchCubit>().searchBooks(
                                _searchController.text,
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      'Enter a search term to find books...',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookSearchResult extends StatelessWidget {
  final BookEntity book;
  final VoidCallback onTap;

  const BookSearchResult({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    print('📖 Rendering book: ${book.title}, Image: ${book.image}');
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading:
            book.image != null && book.image!.isNotEmpty
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    book.image!,
                    width: 50,
                    height: 75,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('🖼️ Image error for ${book.title}: $error');
                      return const Icon(Icons.broken_image, color: Colors.grey);
                    },
                  ),
                )
                : const Icon(Icons.book, size: 50, color: Colors.grey),
        title: Text(
          book.title ?? 'Unknown Title',
          style: const TextStyle(
            color: Color(0xFF392626),
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          book.author ?? 'Unknown Author',
          style: const TextStyle(color: Colors.grey),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing:
            book.previewLink != null && book.previewLink!.isNotEmpty
                ? const Icon(Icons.remove_red_eye, color: Color(0xFF392626))
                : null,
        onTap: onTap,
      ),
    );
  }
}
