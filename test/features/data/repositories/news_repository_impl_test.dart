import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:newsapi_clean_architecture/core/network/network_info.dart';
import 'package:newsapi_clean_architecture/features/data/datasources/news_local_data_source.dart';
import 'package:newsapi_clean_architecture/features/data/datasources/news_remote_data_source.dart';
import 'package:newsapi_clean_architecture/features/data/repositories/news_repository_impl.dart';

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
}
