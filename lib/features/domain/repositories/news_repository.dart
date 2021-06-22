import 'package:dartz/dartz.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';
import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsModel>>> getNewsList();
}