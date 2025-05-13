import 'dart:async';
import 'package:flutter/material.dart';
import 'package:readio/features/books/presentation/views/widgets/text_to_speach_helper.dart';
//import 'package:readio/core/utils/text_to_speech_helper.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

//import '../../text_to_speech_helper.dart';

class ListeningBookView extends StatefulWidget {
  final BookEntity? book;

  const ListeningBookView({super.key, this.book});

  @override
  State<ListeningBookView> createState() => _ListeningBookViewState();
}

class _ListeningBookViewState extends State<ListeningBookView> {
  bool _isPlaying = false;
  double _speechRate = 0.5;
  int _currentWordIndex = 0;
  double _progress = 0.0;
  Timer? _progressTimer;

  @override
  void dispose() {
    _progressTimer?.cancel(); // إيقاف الـ Timer
    TextToSpeechHelper.stop(); // إيقاف الـ TTS
    super.dispose();
  }

  // تقدير عدد الكلمات في 10 ثواني بناءً على الـ Speech Rate
  int _calculateWordsForTenSeconds(double speechRate) {
    double wordsPerSecond = 2.0 * (speechRate / 0.5);
    return (wordsPerSecond * 10).round();
  }

  // تقديم التشغيل بـ 10 ثواني
  void _fastForward() {
    if (widget.book?.description == null) return;
    List<String> words = widget.book!.description!.split(' ');
    int wordsToSkip = _calculateWordsForTenSeconds(_speechRate);
    setState(() {
      _currentWordIndex = (_currentWordIndex + wordsToSkip).clamp(
        0,
        words.length - 1,
      );
      _progress = _currentWordIndex / words.length;
      if (_isPlaying) {
        TextToSpeechHelper.speak(
          widget.book!.description!,
          startWordIndex: _currentWordIndex,
        );
      }
    });
  }

  // تأخير التشغيل بـ 10 ثواني
  void _rewind() {
    if (widget.book?.description == null) return;
    List<String> words = widget.book!.description!.split(' ');
    int wordsToSkip = _calculateWordsForTenSeconds(_speechRate);
    setState(() {
      _currentWordIndex = (_currentWordIndex - wordsToSkip).clamp(
        0,
        words.length - 1,
      );
      _progress = _currentWordIndex / words.length;
      if (_isPlaying) {
        TextToSpeechHelper.speak(
          widget.book!.description!,
          startWordIndex: _currentWordIndex,
        );
      }
    });
  }

  // تحديث التقدم التلقائي
  void _startProgressTimer() {
    if (widget.book?.description == null) return;
    List<String> words = widget.book!.description!.split(' ');
    double wordsPerSecond = 2.0 * (_speechRate / 0.5);
    double totalWords = words.length.toDouble();
    double updateInterval = 0.1;

    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(
      Duration(milliseconds: (updateInterval * 1000).toInt()),
      (timer) {
        if (!_isPlaying) {
          timer.cancel();
          return;
        }
        setState(() {
          _progress += (wordsPerSecond * updateInterval) / totalWords;
          if (_progress >= 1.0) {
            _progress = 1.0;
            _isPlaying = false;
            _currentWordIndex = words.length - 1;
            timer.cancel();
            TextToSpeechHelper.stop();
          }
          _currentWordIndex = (_progress * totalWords).round().clamp(
            0,
            words.length - 1,
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.book?.description == null || widget.book!.description!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.book?.title ?? 'Listen'),
          backgroundColor: const Color(0xFFFEF6E3),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xFF392626)),
        ),
        body: const Center(
          child: Text(
            'No audio content available for this book.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book?.title ?? 'Listen'),
        backgroundColor: const Color(0xFFFEF6E3),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF392626)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // صورة الكتاب
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.book!.image != null && widget.book!.image!.isNotEmpty
                      ? widget.book!.image!
                      : 'https://via.placeholder.com/150',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Image.asset(
                        'assets/images/placeholder.jpg',
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // عنوان الكتاب
            Text(
              widget.book!.title ?? 'Unknown Title',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF392626),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // النص اللي بيتقرأ (Description)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.book!.description!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF392626),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // أزرار التحكم (Rewind, Play/Pause, Stop, Fast Forward)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.fast_rewind,
                    size: 48,
                    color: Color(0xFF392626),
                  ),
                  onPressed: _rewind,
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 48,
                    color: const Color(0xFF392626),
                  ),
                  onPressed: () async {
                    if (_isPlaying) {
                      await TextToSpeechHelper.pause();
                      _progressTimer?.cancel();
                    } else {
                      await TextToSpeechHelper.speak(
                        widget.book!.description!,
                        startWordIndex: _currentWordIndex,
                      );
                      _startProgressTimer();
                    }
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.stop,
                    size: 48,
                    color: Color(0xFF392626),
                  ),
                  onPressed: () async {
                    await TextToSpeechHelper.stop();
                    _progressTimer?.cancel();
                    setState(() {
                      _isPlaying = false;
                      _currentWordIndex = 0;
                      _progress = 0.0;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.fast_forward,
                    size: 48,
                    color: Color(0xFF392626),
                  ),
                  onPressed: _fastForward,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Slider لتغيير السرعة
            Slider(
              value: _speechRate,
              min: 0.1,
              max: 1.0,
              onChanged: (value) async {
                setState(() {
                  _speechRate = value;
                });
                await TextToSpeechHelper.setSpeechRate(value);
                if (_isPlaying) {
                  await TextToSpeechHelper.speak(
                    widget.book!.description!,
                    startWordIndex: _currentWordIndex,
                  );
                  _startProgressTimer();
                }
              },
              activeColor: const Color(0xFF392626),
              inactiveColor: Colors.grey,
            ),
            const Text(
              'Speech Rate',
              style: TextStyle(fontSize: 16, color: Color(0xFF392626)),
            ),
            const SizedBox(height: 16),
            // Slider للتقدم
            Slider(
              value: _progress,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                if (widget.book?.description == null) return;
                List<String> words = widget.book!.description!.split(' ');
                setState(() {
                  _progress = value;
                  _currentWordIndex = (value * words.length).round().clamp(
                    0,
                    words.length - 1,
                  );
                });
                if (_isPlaying) {
                  TextToSpeechHelper.speak(
                    widget.book!.description!,
                    startWordIndex: _currentWordIndex,
                  );
                  _startProgressTimer();
                }
              },
              activeColor: const Color(0xFF392626),
              inactiveColor: Colors.grey,
            ),
            const Text(
              'Reading Progress',
              style: TextStyle(fontSize: 16, color: Color(0xFF392626)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
