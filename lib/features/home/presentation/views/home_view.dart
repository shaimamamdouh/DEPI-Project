import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readio/core/utils/catagory_book_list.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/features/home/data/repository/home_repo_impl.dart';
import 'package:readio/features/home/presentation/manager/audio_books_cubit/fetch_audio_books_cubit.dart';
import 'package:readio/features/home/presentation/manager/top_books_cubit/fetch_top_books_cubit.dart';
import 'package:readio/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:readio/features/home/presentation/views/widgets/home_body.dart';


class HomeView extends StatelessWidget {
  final List<String> bookCovers = [
    'assets/images/kite_runner.jpg',
    'assets/images/kite_runner.jpg',
    'assets/images/kite_runner.jpg',
    'assets/images/kite_runner.jpg',
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchTopBooksCubit(getIt.get<HomeRepoImpl>())..fetchTopBooks(),

        ),
        BlocProvider(
          create: (context) => FetchAudioBooksCubit(getIt.get<HomeRepoImpl>())..fetchTopBooks(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: HomeAppBar(),
        body: HomeBody(categories: categories,),
      ),
    );
  }
}
