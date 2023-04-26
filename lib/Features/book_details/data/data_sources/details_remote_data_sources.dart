import '../../../../core/functions/convert_data_into_books_list.dart';
import '../../../../core/shared/entities/book_entity/book_entity.dart';
import '../../../../core/utils/api_services.dart';

abstract class DetailsRemoteDataSources {
  Future<List<BookEntity>> fetchSimilarBooks(String category);
}

class DetailsRemoteDataSourcesImpl implements DetailsRemoteDataSources {
  DetailsRemoteDataSourcesImpl(this.apiServices);

    final ApiServices apiServices;

    @override
    Future<List<BookEntity>> fetchSimilarBooks(String category) async {
      var data = await apiServices
          .get('volumes?Filtering=ebooks&Sorting=relevance&q=subject:$category');
      List<BookEntity> books = convertDataIntoBooksList(data);
      return books;
    }
  }
