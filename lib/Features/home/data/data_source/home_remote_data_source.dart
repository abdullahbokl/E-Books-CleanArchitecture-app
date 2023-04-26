import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/functions/save_books_locally.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchAllBooks();

  Future<List<BookEntity>> fetchBestSellingBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchAllBooks() async {
    var data =
        await apiServices.get('volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = convertDataIntoBooksList(data);

    saveBooksLocally(booksList: books, boxName: AppStrings.allBooksBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchBestSellingBooks() async {
    var data = await apiServices
        .get('volumes?Filtering=best-seller&Sorting=newest&q=programming');

    List<BookEntity> books = convertDataIntoBooksList(data);

    saveBooksLocally(booksList: books, boxName: AppStrings.bestSellerBox);

    return books;
  }
}
