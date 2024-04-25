import 'package:test/test.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';

import '../../mocks/movie_mock.dart';

void main() {
  final MovieEntity movie = MovieMock.entity.copyWith();

  test('should return true', () {
    expect(movie.props.isNotEmpty, true);
  });

  test('should check consistency of props', () {
    expect(movie.id, 1);
  });
}
