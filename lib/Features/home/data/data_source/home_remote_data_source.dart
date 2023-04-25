import '../../../../core/shared/models/book_model/BookModel.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/shared/functions/save_books_locally.dart';
import '../../../../core/utils/strings.dart';
import '../../domain/entities/book_entity.dart';
import 'data_sources.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchAllBooks() async {
    var data =
        await apiServices.get('volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = _getBooksList(data);

    saveBooksLocally(booksList: books, boxName: AppStrings.allBooksBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchBestSellingBooks() async {
    var data = await apiServices
        .get('volumes?Filtering=best-seller&Sorting=newest&q=programming');

    List<BookEntity> books = _getBooksList(data);

    saveBooksLocally(booksList: books, boxName: AppStrings.bestSellerBox);

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
