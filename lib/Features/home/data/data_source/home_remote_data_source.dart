import '../../../../core/utils/api_services.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data =
        await apiServices.get('volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = _getBooksList(data);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices
        .get('volumes?Filtering=best-seller&Sorting=newest&q=programming');

    List<BookEntity> books = _getBooksList(data);

    return books;
  }

  List<BookEntity> _getBooksList(data) {
    List<BookEntity> books = [];

    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
