 import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:newsapi_clean_architecture/features/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  @override
  Future<Either<Failure, List<NewsEntity>>> getNewsList() {
    // TODO: implement getNewsList
    throw UnimplementedError();
  }

}