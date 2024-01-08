import 'package:ditonton_dicoding_submission/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const gender1 = Genre(id: 1, name: "Action");

  const gender2 = Genre(id: 1, name: "Action");

  const gender3 = Genre(id: 2, name: "Action");
  group('gender', () {
    test('should be a equal to other gender', () async {
      expect(true, gender1 == gender2);
    });

    test('should be a not equal because different id', () async {
      expect(true, gender1 != gender3);
    });
  });
}
