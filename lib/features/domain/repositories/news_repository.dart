import 'package:dartz/dartz.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getNewsList();
}