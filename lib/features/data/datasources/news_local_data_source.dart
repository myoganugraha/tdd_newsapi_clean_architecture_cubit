import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getNewsListFromLocal();
  Future<void> cacheNewsList(List<NewsModel> newsList );
}
