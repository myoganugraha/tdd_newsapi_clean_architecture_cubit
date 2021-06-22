import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:newsapi_clean_architecture/core/usecases/usecase.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/source_entity.dart';
import 'package:newsapi_clean_architecture/features/domain/repositories/news_repository.dart';
import 'package:newsapi_clean_architecture/features/domain/usecases/get_news_list.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late GetNewsList usecase;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    usecase = GetNewsList(mockNewsRepository);
  });

  final tNewsList = [ 
    NewsEntity(
        author: 'author1',
        title: 'title1',
        description: 'description1',
        url: 'url1',
        urlToImage: 'urlToImage1',
        content: 'content1',
        source: SourceEntity(id: 'id1', name: 'name1')),
    NewsEntity(
        author: 'author2',
        title: 'title2',
        description: 'description2',
        url: 'url2',
        urlToImage: 'urlToImage2',
        content: 'content2',
        source: SourceEntity(id: 'id2', name: 'name2')),
    NewsEntity(
        author: 'author3',
        title: 'title3',
        description: 'description3',
        url: 'url3',
        urlToImage: 'urlToImage3',
        content: 'content3',
        source: SourceEntity(id: 'id3', name: 'name3'))
  ];

  test('harusnya dapet list data dari repo', () async {
    when(() => mockNewsRepository.getNewsList())
        .thenAnswer((realInvocation) async => Right(tNewsList));
    final result = await usecase(NoParams());
    expect(result, Right(tNewsList));
    verify(() => mockNewsRepository.getNewsList());
    verifyNoMoreInteractions(mockNewsRepository);
  });
}
