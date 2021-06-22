import 'package:dartz/dartz.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';
import 'package:newsapi_clean_architecture/features/domain/repositories/news_repository.dart';

class GetNewsList {
  final NewsRepository newsRepository;

  GetNewsList(this.newsRepository);

  Future<Either<Failure, List<NewsModel>>> call() async {
    return newsRepository.getNewsList();
  }
}
