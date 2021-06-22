import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/source_entity.dart';

void main() {
  final tSourceModel = SourceModel(id: 'id', name: 'name');

  test(
    'should be subclass of source entity',
    () async {
      // arrange

      // act

      // assert
      expect(tSourceModel, isA<SourceEntity>());
    },
  );
}
