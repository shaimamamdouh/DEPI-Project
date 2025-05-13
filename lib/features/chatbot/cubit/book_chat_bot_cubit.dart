import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readio/features/home/data/models/book_model/book_model.dart';
import '../../../core/utils/functions/book_api_service.dart';

class ChatMessage {
  final String text;
  final bool isBot;
  final BookModel? book; // To store the book if the user searches for a specific book

  ChatMessage({required this.text, required this.isBot, this.book});
}

class BookChatBotState {
  final List<ChatMessage> messages;
  final bool isLoading;

  BookChatBotState({required this.messages, this.isLoading = false});
}

class BookChatBotCubit extends Cubit<BookChatBotState> {
  final BookApiService apiService;

  BookChatBotCubit(this.apiService)
      : super(BookChatBotState(messages: [
    ChatMessage(
      text: 'Hello! I\'m the Book Chat Bot. I can suggest books based on category, author, or search for a specific book. What would you like?',
      isBot: true,
    ),
  ]));

  Future<void> processMessage(String userInput) async {
    emit(BookChatBotState(messages: [
      ...state.messages,
      ChatMessage(text: userInput, isBot: false),
    ], isLoading: true));

    try {
      if (userInput.toLowerCase().contains('category')) {
        final category = userInput
            .replaceAll(RegExp(r'(category)\s*', caseSensitive: false), '')
            .trim();
        final books = await apiService.searchBooksByCategory(category);
        final response = books.isEmpty
            ? 'No books found in this category. Try another category!'
            : 'Here are 3 books in the "$category" category:\n' +
            books
                .asMap()
                .entries
                .map((entry) =>
            '${entry.key + 1}. "${entry.value.title}" by ${entry.value.author ?? 'Unknown'}\n   - Description: ${entry.value.description?.substring(0, entry.value.description!.length > 100 ? 100 : entry.value.description!.length) ?? 'No description'}...')
                .join('\n');
        emit(BookChatBotState(messages: [
          ...state.messages,
          ChatMessage(text: response, isBot: true),
        ], isLoading: false));
      } else if (userInput.toLowerCase().contains('author')) {
        final author = userInput
            .replaceAll(RegExp(r'(author)\s*', caseSensitive: false), '')
            .trim();
        final books = await apiService.searchBooksByAuthor(author);
        final response = books.isEmpty
            ? 'No books found for this author. Try another author!'
            : 'Here are 3 books by "$author":\n' +
            books
                .asMap()
                .entries
                .map((entry) =>
            '${entry.key + 1}. "${entry.value.title}"\n   - Description: ${entry.value.description?.substring(0, entry.value.description!.length > 100 ? 100 : entry.value.description!.length) ?? 'No description'}...')
                .join('\n');
        emit(BookChatBotState(messages: [
          ...state.messages,
          ChatMessage(text: response, isBot: true),
        ], isLoading: false));
      } else {
        final book = await apiService.searchBookByTitle(userInput);
        final response = book == null
            ? 'No book found with this title. Try another title!'
            : 'Book found!\n- Title: "${book.title}"\n- Author: ${book.author ?? 'Unknown'}\n- Description: ${book.description?.substring(0, book.description!.length > 100 ? 100 : book.description!.length) ?? 'No description'}...\n- Preview: ${book.previewLink?.isNotEmpty ?? false ? 'Available' : 'Not available'}';
        emit(BookChatBotState(messages: [
          ...state.messages,
          ChatMessage(text: response, isBot: true, book: book),
        ], isLoading: false));
      }
    } catch (e) {
      emit(BookChatBotState(messages: [
        ...state.messages,
        ChatMessage(text: 'An error occurred: ${e.toString()}', isBot: true),
      ], isLoading: false));
    }
  }
}