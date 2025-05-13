import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';
import 'package:readio/features/home/presentation/manager/audio_books_cubit/fetch_audio_books_cubit.dart';
import 'package:readio/features/home/presentation/manager/top_books_cubit/fetch_top_books_cubit.dart';
import 'package:readio/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:readio/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FetchTopBooksCubit(getIt.get<HomeRepo>())..fetchTopBooks(),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchAudioBooksCubit(getIt.get<HomeRepo>())
                    ..fetchAudioBooks(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const HomeAppBar(),
        body: const HomeBody(),
        floatingActionButton: FloatingActionButton(
        //  child: const Image(image: AssetImage('assets/images/chatbot.png')),
          onPressed: () {
            context.push('/BookChatBotView');
          },
        ),
      ),
    );
  }
}
