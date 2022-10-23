import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/data/network/response/movie_list_response.dart';
import 'package:flutter_recruitment_task/data/network/response/movie_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_network_service.g.dart';

@singleton
@RestApi()
abstract class ApiNetworkService {
  @factoryMethod
  factory ApiNetworkService(Dio dio) {
    return _ApiNetworkService(dio);
  }

  @GET('search/movie?api_key={apiKey}&query={query}&page={page}')
  Future<MovieListResponse> getMovies({
    @Path("apiKey") required String apiKey,
    @Path("query") required String query,
    @Path("page") required int page,
  });

  @GET('movie/{id}?api_key={apiKey}')
  Future<MovieResponse> getMovieDetails({
    @Path("apiKey") required String apiKey,
    @Path("id") required int id,
  });
}
