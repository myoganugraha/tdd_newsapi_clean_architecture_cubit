import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';
import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tNewsModel = NewsModel(
      author: 'author',
      title: 'title',
      description: 'description',
      url: 'url',
      urlToImage: 'urlToImage',
      content: 'content',
      publishedAt: 'publishedAt',
      source: SourceModel(id: 'id', name: 'name'));

  test(
    'should be subclass of news entity',
    () async {
      // arrange

      // act

      // assert
      expect(tNewsModel, isA<NewsEntity>());
    },
  );

  group('fromJSON', () {
    test(
      'should return valid model  ',
      () async {
        // arrange
        final Map<String, dynamic> json =
            jsonDecode(fixture('news.json'));
        // act
        final result = NewsModel.fromJson(json);
        // assert
        expect(result, tNewsModel);
      },
    );
  });
}
