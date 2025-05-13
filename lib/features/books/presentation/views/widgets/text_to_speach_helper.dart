import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechHelper {
  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (!_isInitialized) {
      try {
    
        await _tts.setLanguage('en-US');
     
        await _tts.setSpeechRate(0.5);
        await _tts.setVolume(1.0);
        await _tts.setPitch(1.0);
        _isInitialized = true;
        print('TTS initialized successfully');
      } catch (e) {
        print('Error initializing TTS: $e');
        _isInitialized = false; // إعادة تعيين الحالة لو حصل خطأ
      }
    }
  }

  static Future<void> speak(String text, {int startWordIndex = 0}) async {
    try {
      await init(); // التأكد إن TTS جاهز
      await _tts.stop(); // إيقاف أي تشغيل سابق
      // تقسيم النص إلى كلمات
      List<String> words = text.split(' ');
      if (startWordIndex >= words.length) {
        print('Start word index out of range');
        return; // لو المؤشر خارج النطاق، ما يعملش حاجة
      }
      // إعادة تجميع النص من الكلمة المطلوبة
      String textToSpeak = words.sublist(startWordIndex).join(' ');
      await _tts.speak(textToSpeak);
      print('Speaking: $textToSpeak');
    } catch (e) {
      print('Error speaking text: $e');
    }
  }

  static Future<void> pause() async {
    try {
      await _tts.pause();
      print('TTS paused');
    } catch (e) {
      print('Error pausing TTS: $e');
    }
  }

  static Future<void> stop() async {
    try {
      await _tts.stop();
      print('TTS stopped');
    } catch (e) {
      print('Error stopping TTS: $e');
    }
  }

  static Future<void> setSpeechRate(double rate) async {
    try {
      await _tts.setSpeechRate(rate);
      print('Speech rate set to $rate');
    } catch (e) {
      print('Error setting speech rate: $e');
    }
  }

  static Future<void> setVolume(double volume) async {
    try {
      await _tts.setVolume(volume);
      print('Volume set to $volume');
    } catch (e) {
      print('Error setting volume: $e');
    }
  }

  static Future<void> setPitch(double pitch) async {
    try {
      await _tts.setPitch(pitch);
      print('Pitch set to $pitch');
    } catch (e) {
      print('Error setting pitch: $e');
    }
  }

  static Future<List<dynamic>> getVoices() async {
    try {
      final voices = await _tts.getVoices;
      print('Voices retrieved: $voices');
      return voices;
    } catch (e) {
      print('Error getting voices: $e');
      return [];
    }
  }
}