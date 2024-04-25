import 'package:get_it/get_it.dart';
import 'package:the_movies_api/core/http_client/http_client.dart';
import 'package:the_movies_api/core/http_client/http_client_imp.dart';
import 'package:the_movies_api/data/datasources/movie_datasource.dart';
import 'package:the_movies_api/data/datasources/themoviedb_datasource_imp.dart';
import 'package:the_movies_api/data/repositories/movie_repository_imp.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/domain/usecases/get_all_movies_or_series_usecase.dart';
import 'package:the_movies_api/domain/usecases/get_list_popular_movies_usecase.dart';
import 'package:the_movies_api/domain/usecases/get_list_trending_movies_usecase.dart';
import 'package:the_movies_api/domain/usecases/get_movie_by_id_widget.dart';
import 'package:the_movies_api/domain/usecases/search_movie_usecase.dart';
import 'package:the_movies_api/presentation/all_movies_series/bloc/get_all_movies_series/get_all_movies_series_bloc.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_bloc.dart';
import 'package:the_movies_api/presentation/home/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //register blocs
  getIt.registerFactory<GetMoviesPopularTrendingBloc>(
      () => GetMoviesPopularTrendingBloc(
            getMoviesPopularUseCase: getIt(),
            getMoviesTrendingUsecase: getIt(),
          ));
  getIt.registerFactory<GetMovieByIdBloc>(
    () => GetMovieByIdBloc(getMovieByIdUsecase: getIt()),
  );
  getIt.registerFactory<SearchMovieBloc>(
    () => SearchMovieBloc(searchMovieUsecase: getIt()),
  );
  getIt.registerFactory<GetAllMoviesSeriesBloc>(
    () => GetAllMoviesSeriesBloc(getMoviesPopularUseCase: getIt()),
  );

  //register usecases
  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetTrendingMoviesUsecase>(
    () => GetTrendingMoviesUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetMovieByIdUsecase>(
    () => GetMovieByIdUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton<SearchMovieUsecase>(
    () => SearchMovieUsecase(repository: getIt()),
  );
  getIt.registerFactory<GetAllMoviesSeriesUsecase>(
    () => GetAllMoviesSeriesUsecase(repository: getIt()),
  );

  //register repositories
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImp(movieDatasource: getIt()),
  );

  //register datasources
  getIt.registerLazySingleton<MovieDatasource>(
    () => TheMoviedbDatasourceImp(client: getIt()),
  );

  //register http client
  getIt.registerLazySingleton<HttpClient>(() => HttpClientImp());
}
