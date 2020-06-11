import 'dart:math';

class InspirationalQuotes {
  static Map<int, String> quotes = {
    0 : 'The way to get started is to quit talking and begin doing',
    1 : 'The pessimist sees difficulty in every opportunity. The optimist sees the opportunity in every difficulty',
    2 : 'Dont let yesterday take up much of today',
    3 : 'Make your life a masterpiece\nImagine no limitation on what you can be, have or do',
    4 : 'You learn more from failure than success.\nDont let it stop you.\nFailure builds character'
  };

  static String get uniqueQuote {
    return quotes[Random().nextInt(5)];
  }
}