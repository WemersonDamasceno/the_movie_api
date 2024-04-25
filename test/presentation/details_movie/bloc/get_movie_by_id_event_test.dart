import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/presentation/details_movie/bloc/get_movie_by_id_event.dart';

void main() {
  group('GetMovieByIdEvent', () {
    test('supports value comparisons', () {
      final event1 = GetMovieById(idMovie: 1);
      final event2 = GetMovieById(idMovie: 1);

      expect(event1, event2);
    });

    test('returns correct props', () {
      final event = GetMovieById(idMovie: 1);
      expect(event.props, [1]);
    });
  });
}
