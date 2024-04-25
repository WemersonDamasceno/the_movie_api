import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/presentation/home/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';

void main() {
  group('MovieEvent', () {
    test('should compare PopularMoviesLoadEvent instances', () {
      expect(const PopularMoviesLoadEvent(), const PopularMoviesLoadEvent());
    });

    test('should compare TrendingMoviesLoadEvent instances', () {
      expect(const TrendingMoviesLoadEvent(), const TrendingMoviesLoadEvent());
    });

    test('verify PopularMoviesLoadEvent props', () {
      expect(const PopularMoviesLoadEvent().props, []);
    });

    test('verify TrendingMoviesLoadEvent props', () {
      expect(const TrendingMoviesLoadEvent().props, []);
    });
  });
}
