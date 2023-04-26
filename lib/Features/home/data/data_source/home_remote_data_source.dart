import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/functions/save_books_locally.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchAllBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchAllBooks() async {
    var data =
        await apiServices.get('volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = convertDataIntoBooksList(data);

    await saveBooksLocally(booksList: books, boxName: AppStrings.allBooksBox, key: AppStrings.allBooksKey);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices
        .get('volumes?Filtering=best-seller&Sorting=newest&q=programming');

    List<BookEntity> books = convertDataIntoBooksList(data);

    await saveBooksLocally(booksList: books, boxName: AppStrings.newestBooksBox, key: AppStrings.newestBooksKey);

    return books;
  }
}
