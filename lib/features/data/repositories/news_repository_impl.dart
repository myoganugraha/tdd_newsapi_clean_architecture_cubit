import 'package:newsapi_clean_architecture/core/error/exceptions.dart';
import 'package:newsapi_clean_architecture/core/network/network_info.dart';
import 'package:newsapi_clean_architecture/features/data/datasources/news_local_data_source.dart';
import 'package:newsapi_clean_architecture/features/data/datasources/news_remote_data_source.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:newsapi_clean_architecture/features/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<NewsEntity>>> getNewsList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNewsList = await remoteDataSource.getNewsList();
        localDataSource.cacheNewsList(remoteNewsList);
        return Right(remoteNewsList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(await localDataSource.getNewsListFromLocal());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
