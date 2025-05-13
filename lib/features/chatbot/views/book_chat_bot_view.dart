import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/features/chatbot/cubit/book_chat_bot_cubit.dart';
import '../../../core/utils/functions/book_api_service.dart';

class ColorsData {
  static const Color secondaryColor = Color(0xffD2B48C);
  static const Color textColor = Color(0xff4B2E1E);
}

class BookChatBotView extends StatelessWidget {
  const BookChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookChatBotCubit(getIt<BookApiService>()),
      child: const _BookChatBotView(),
    );
  }
}

class _BookChatBotView extends StatefulWidget {
  const _BookChatBotView();

  @override
  State<_BookChatBotView> createState() => __BookChatBotViewState();
}

class __BookChatBotViewState extends State<_BookChatBotView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Chat Bot',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ColorsData.textColor,
          ),
        ),
        backgroundColor: ColorsData.secondaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<BookChatBotCubit, BookChatBotState>(
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(12),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[state.messages.length - 1 - index];
                    return Align(
                      alignment: message.isBot
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: GestureDetector(
                        onTap: message.book != null
                            ? () {
                          context.push('/BookDetailsView', extra: message.book);
                        }
                            : null,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: message.isBot
                                ? ColorsData.secondaryColor.withOpacity(0.2)
                                : ColorsData.secondaryColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            message.text,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: ColorsData.textColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (context.read<BookChatBotCubit>().state.isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: ColorsData.secondaryColor,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: ColorsData.textColor,
                  ),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      context
                          .read<BookChatBotCubit>()
                          .processMessage(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: ColorsData.textColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter a category, author, or book title...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Roboto',
                        color: ColorsData.textColor,
                      ),
                      filled: true,
                      fillColor: ColorsData.secondaryColor.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}