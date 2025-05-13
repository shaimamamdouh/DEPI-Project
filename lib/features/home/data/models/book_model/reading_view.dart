import 'package:flutter/material.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadingView extends StatefulWidget {
  final BookEntity? book;

  const ReadingView({super.key, this.book});

  @override
  State<ReadingView> createState() => _ReadingViewState();
}

class _ReadingViewState extends State<ReadingView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFEF6E3))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _isLoading = progress < 100;
            });
          },
          onPageStarted: (String url) {
            print('📄 Page started: $url');
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            print('📄 Page finished: $url');
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _isLoading = false;
              _errorMessage = 'Failed to load preview: ${error.description}';
            });
            print('🚨 WebView Error: ${error.description}');
          },
        ),
      );
    if (widget.book?.previewLink != null && widget.book!.previewLink!.isNotEmpty) {
      print('📖 Loading PreviewLink: ${widget.book!.previewLink}');
      _controller.loadRequest(Uri.parse(widget.book!.previewLink!));
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'No preview available for this book';
      });
      print('⚠️ PreviewLink is null or empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.book?.title ?? 'Reading'),
          backgroundColor: const Color(0xFFFEF6E3),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xFF392626)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              if (widget.book?.description != null) ...[
                const Text(
                  'Book Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.book!.description!,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // العودة لصفحة التفاصيل
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF392626),
                    foregroundColor: const Color(0xFFFEF6E3),
                  ),
                  child: const Text('Back to Book Details'),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book?.title ?? 'Reading'),
        backgroundColor: const Color(0xFFFEF6E3),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF392626)),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CircularProgressIndicator(color: Color(0xFF392626))),
        ],
      ),
    );
  }
}