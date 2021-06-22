import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNewsList();
}
