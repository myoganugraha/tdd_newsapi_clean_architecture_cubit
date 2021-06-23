import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:newsapi_clean_architecture/core/error/exceptions.dart';
import 'package:newsapi_clean_architecture/core/error/failures.dart';
import 'package:newsapi_clean_architecture/core/network/network_info.dart';
import 'package:newsapi_clean_architecture/features/data/datasources/news_local_data_source.dart';
import 'package:newsapi_clean_architecture/features/data/datasources/news_remote_data_source.dart';
import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';
import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';
import 'package:newsapi_clean_architecture/features/data/repositories/news_repository_impl.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';

class MockRemoteDataSource extends Mock implements NewsRemoteDataSource {}

class MockLocalDataSource extends Mock implements NewsLocalDataSource {}

class MockNetworkinfo extends Mock implements NetworkInfo {}

void main() {
  late NewsRepositoryImpl repositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkinfo mockNetworkinfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkinfo = MockNetworkinfo();
    repositoryImpl = NewsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkinfo,
    );
  });

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() => when(() => mockNetworkinfo.isConnected)
          .thenAnswer((_) async => true));
      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() => when(() => mockNetworkinfo.isConnected)
          .thenAnswer((_) async => false));
      body();
    });
  }

  group('get news', () {
    final tNewsListModel = [
      NewsModel(
          author: 'author',
          title: 'title',
          description: 'description',
          url: 'url',
          urlToImage: 'urlToImage',
          content: 'content',
          publishedAt: 'publishedAt',
          source: SourceModel(id: 'id', name: 'name')),
      NewsModel(
          author: 'author',
          title: 'title',
          description: 'description',
          url: 'url',
          urlToImage: 'urlToImage',
          content: 'content',
          publishedAt: 'publishedAt',
          source: SourceModel(id: 'id', name: 'name')),
      NewsModel(
          author: 'author',
          title: 'title',
          description: 'description',
          url: 'url',
          urlToImage: 'urlToImage',
          content: 'content',
          publishedAt: 'publishedAt',
          source: SourceModel(id: 'id', name: 'name'))
    ];
    final List<NewsEntity> tNewsListEntity = tNewsListModel;
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(() => mockNetworkinfo.isConnected).thenAnswer((_) async => true);
        // act
        repositoryImpl.getNewsList();
        // assert
        verify(() => mockNetworkinfo.isConnected);
      },
    );

    runTestOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getNewsList())
              .thenAnswer((_) async => tNewsListModel);
          // act
          final result = await repositoryImpl.getNewsList();
          // assert
          verify(() => mockRemoteDataSource.getNewsList());
          expect(result, equals(Right(tNewsListEntity)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getNewsList())
              .thenAnswer((_) async => tNewsListModel);
          // act
          await repositoryImpl.getNewsList();
          // assert
          verify(() => mockRemoteDataSource.getNewsList());
          verify(() => mockLocalDataSource.cacheNewsList(tNewsListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getNewsList())
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getNewsList();
          // assert
          verify(() => mockRemoteDataSource.getNewsList());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestOffline(() {
      test(
        'should return last locally cached data ',
        () async {
          // arrange
          when(() => mockLocalDataSource.getNewsListFromLocal())
              .thenAnswer((_) async => tNewsListModel);
          // act
          final result = await repositoryImpl.getNewsList();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getNewsListFromLocal());
          expect(result, equals(Right(tNewsListEntity)));
        },
      );

      test(
        'should return cache failure when there is no cache data ',
        () async {
          // arrange
          when(() => mockLocalDataSource.getNewsListFromLocal())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getNewsList();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getNewsListFromLocal());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
