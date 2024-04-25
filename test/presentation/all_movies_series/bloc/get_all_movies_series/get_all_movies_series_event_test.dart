import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/presentation/all_movies_series/bloc/get_all_movies_series/get_all_movies_series_bloc.dart';

void main() {
  late GetAllMoviesSeriesEvent event;

  setUp(() {
    event = const GetAllMoviesSeries(category: 'movies');
  });

  group('GetAllMoviesSeriesEvent', () {
    test('events: should support value comparisons', () {
      expect(const GetAllMoviesSeries(category: 'movies'),
          const GetAllMoviesSeries(category: 'movies'));
    });

    test('should have correct props', () {
      expect(event.props, ['movies']);
    });
  });
}
