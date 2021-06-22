import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:newsapi_clean_architecture/features/data/models/news_model.dart';
import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';

void main() {
  final tNewsModel = NewsModel(
      author: 'author',
      title: 'title',
      description: 'description',
      url: 'url',
      urlToImage: 'urlToImage',
      content: 'content',
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
}
