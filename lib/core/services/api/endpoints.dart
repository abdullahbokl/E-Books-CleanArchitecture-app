abstract class EndPoints {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  static final Books books = Books();
}

class Books {
  final String fetchAllBooks = 'volumes';
  final String fetchNewestBooks = 'volumes';
  final String fetchSimilarBooks = 'volumes';
}
