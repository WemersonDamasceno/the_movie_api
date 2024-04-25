import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/presentation/search/bloc/search_movie_event.dart';

void main() {
  group('SearchMovieEvent', () {
    test('supports value comparisons', () {
      expect(
        SearchMovie('query'),
        SearchMovie('query'),
      );
    });

    test('returns correct query value', () {
      final event = SearchMovie('query');

      expect(event.query, 'query');
    });
  });
}
