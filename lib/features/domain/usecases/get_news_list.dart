import 'package:dartz/dartz.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:newsapi_clean_architecture/core/usecases/usecase.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';
import 'package:newsapi_clean_architecture/features/domain/repositories/news_repository.dart';

class GetNewsList implements UseCase<List<NewsEntity>, NoParams> {
  final NewsRepository newsRepository;

  GetNewsList(this.newsRepository);

  @override
  Future<Either<Failure, List<NewsEntity>>> call(NoParams params) async {
    return newsRepository.getNewsList();
  }
}
