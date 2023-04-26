import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchBooksByQuery(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl(this.apiServices);

  final ApiServices apiServices;

  @override
  Future<List<BookEntity>> fetchBooksByQuery(String query) async {
    var data = await apiServices.get('volumes?q=$query');
    List<BookEntity> books = convertDataIntoBooksList(data);
    return books;
  }
}
