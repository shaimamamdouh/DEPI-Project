import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/functions/locator_service.dart';
import 'package:readio/features/chatBot/cubit/chat_bot_cubit.dart';
import 'package:readio/features/search/data/book_api.dart';


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
    final theme = Theme.of(context); // Dynamically get the current theme

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Use theme's scaffold background
      appBar: AppBar(
        title: Text(
          'Book Chat Bot',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: theme.appBarTheme.foregroundColor, // Use theme's app bar foreground
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor, // Use theme's app bar background
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
                                ? theme.appBarTheme.backgroundColor?.withOpacity(0.2)
                                : theme.appBarTheme.backgroundColor?.withOpacity(0.4), // Use theme's app bar background with opacity
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
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: theme.textTheme.bodyLarge?.color, // Use theme's text color
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: theme.appBarTheme.backgroundColor, // Use theme's app bar background
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: theme.textTheme.bodyLarge?.color, // Use theme's text color
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
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: theme.textTheme.bodyLarge?.color, // Use theme's text color
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter a category, author, or book title...',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        color: theme.textTheme.bodyLarge?.color, // Use theme's text color
                      ),
                      filled: true,
                      fillColor: theme.appBarTheme.backgroundColor?.withOpacity(0.1), // Use theme's app bar background with opacity
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