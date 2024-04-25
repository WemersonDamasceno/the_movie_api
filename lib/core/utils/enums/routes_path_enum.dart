enum RoutesPathEnum {
  onboard(name: 'splash-page', path: '/splash-page'),
  home(name: 'home-page', path: '/home-page'),
  search(name: 'search-page', path: '/search-page'),
  allMoviesSeries(
      name: 'all-movies-series-page', path: '/all-movies-series-page'),
  detailsMovie(name: 'details-movie-page', path: '/details-movie-page');

  const RoutesPathEnum({required this.name, required this.path});

  final String name;
  final String path;
}
