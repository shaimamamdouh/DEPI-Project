import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readio/core/utils/catagory_book_list.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';
import 'package:readio/features/home/presentation/manager/audio_books_cubit/fetch_audio_books_cubit.dart';
import 'package:readio/features/home/presentation/manager/top_books_cubit/fetch_top_books_cubit.dart';
import 'package:readio/features/home/presentation/views/widgets/audio_books_list_view.dart';
import 'package:readio/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_main_text.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_paner.dart';
//import 'package:readio/features/home/presentation/views/widgets/saved_books_list.dart';
import 'package:readio/features/home/presentation/views/widgets/saved_books_list_view.dart';
import 'package:readio/features/home/presentation/views/widgets/top_books_list_view.dart';



class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CustomPaner()],
            ),
            SizedBox(height: 24),
            CustomMainText(text: 'Check Categories:'),
            SizedBox(height: 12),
            SizedBox(
              height: 70,
              child: CategoriesListView(categories: categories),
            ),
            SizedBox(height: 24),
            CustomMainText(text: 'Top picks for you:'),
            SizedBox(height: 12),
            SizedBox(height: 200, child: TopBooksBlocProvider()),
            SizedBox(height: 24),
            CustomMainText(text: 'Audio Books:'),
            SizedBox(height: 12),
            SizedBox(height: 200, child: AudioBooksBlocProvider()),
            SizedBox(height: 24),
            CustomMainText(text: 'Your Books:'),
            SizedBox(height: 12),
            SizedBox(height: 200, child: SavedBooksListView()),



          ],
        ),
      ),
    );
  }
}

class TopBooksBlocProvider extends StatelessWidget {
  const TopBooksBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTopBooksCubit, FetchTopBooksState>(
      builder: (context, state) {
        if (state is FetchTopBooksFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is FetchTopBooksSuccess) {
          return TopBooksListView(bookCovers: state.books);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AudioBooksBlocProvider extends StatelessWidget {
  const AudioBooksBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchAudioBooksCubit(getIt.get<HomeRepo>())..fetchAudioBooks(),
      child: BlocBuilder<FetchAudioBooksCubit, FetchAudioBooksState>(
        builder: (context, state) {
          if (state is FetchAudioBooksFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is FetchAudioBooksSuccess) {
            return AudioBooksListView(bookCovers: state.books);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}