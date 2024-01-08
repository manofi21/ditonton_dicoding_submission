import 'package:ditonton_dicoding_submission/domain/entities/base_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

class TestItemEntity extends BaseItemEntity {
  const TestItemEntity(
      {required super.title,
      required super.overview,
      required super.posterPath,
      required super.id,
      required super.type});
}

void main() {
  const currentItem = TestItemEntity(
    title: 'title',
    overview: 'overview',
    posterPath: 'posterPath',
    id: 1,
    type: ItemType.movie,
  );

  group('BaseItemEntity', () {
    test('should be a equal to other TestItemEntity', () async {
      const testItem = TestItemEntity(
        title: 'title',
        overview: 'overview',
        posterPath: 'posterPath',
        id: 1,
        type: ItemType.movie,
      );

      expect(true, currentItem == testItem);
    });

    test('should be a not equal because title different', () async {
      const testItem = TestItemEntity(
        title: 'tit--le',
        overview: 'overview',
        posterPath: 'posterPath',
        id: 1,
        type: ItemType.movie,
      );

      expect(true, currentItem != testItem);
    });

    test('should be a not equal because overview different', () async {
      const testItem = TestItemEntity(
        title: 'title',
        overview: 'overview item',
        posterPath: 'posterPath',
        id: 1,
        type: ItemType.movie,
      );

      expect(true, currentItem != testItem);
    });

    test('should be a not equal because posterPath different', () async {
      const testItem = TestItemEntity(
        title: 'title',
        overview: 'overview',
        posterPath: 'poster-Path',
        id: 1,
        type: ItemType.movie,
      );

      expect(true, currentItem != testItem);
    });

    test('should be a not equal because id different', () async {
      const testItem = TestItemEntity(
        title: 'title',
        overview: 'overview',
        posterPath: 'posterPath',
        id: 2,
        type: ItemType.movie,
      );

      expect(true, currentItem != testItem);
    });

    test('should be a not equal because type different', () async {
      const testItem = TestItemEntity(
        title: 'title',
        overview: 'overview',
        posterPath: 'posterPath',
        id: 1,
        type: ItemType.tvSeries,
      );

      expect(true, currentItem != testItem);
    });
  });
}
