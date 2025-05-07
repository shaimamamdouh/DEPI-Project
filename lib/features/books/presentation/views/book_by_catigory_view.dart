import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
//import 'package:features/home/presentation/manager/top_books_cubit/fetch_top_books_cubit.dart';

import '../../../home/domain/entities/book_entity.dart';
import '../../../home/presentation/manager/top_books_cubit/fetch_top_books_cubit.dart';

class BookByCatigoryView extends StatelessWidget {
  const BookByCatigoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Book Catigory'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BookByCatigoryBody(),
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
              return BookBycatigoryItem(book: state.books[index]);
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

class BookBycatigoryItem extends StatelessWidget {
  final BookEntity book; // لازم يكون book معرّف هنا
  const BookBycatigoryItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () => context.push('/BookDetailsView'),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Image.network(
                book.image,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/placeholder.jpg'),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('the kite runner'),
                    Text('Khaled Hosseini'),
                    Row(
                      children: [
                        Text('3.5'),
                        Icon(Icons.star, color: Colors.yellow),
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
