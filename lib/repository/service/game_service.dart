
import 'dart:convert';


import 'package:game_info_app/repository/models/game.dart';
import 'package:game_info_app/repository/models/genre.dart';
import 'package:game_info_app/repository/models/result.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum ApiClientExceptionType { ErrorGettingGames,ErrorGettingGenres, ErrorEmptyResponse, Other }

class ApiClientException implements Exception{
  final ApiClientExceptionType type;

  ApiClientException(this.type);

}

class GameService{
  final String _apiKey= 'gKslN23n3hgF3j12SHKkm8er';
  final String baseUrl;
  final Client _httpClient;

  GameService({
    http.Client? httpClient,
    this.baseUrl = 'https://api.rawg.io/api', 
    }):_httpClient= httpClient ?? http.Client();
  

  Uri getUrl({required String url, Map<String,String>? extraParameters,}){

    final queryParameters = <String,String>{
      'key':_apiKey
    };
    if(extraParameters !=null) {
    queryParameters.addAll(extraParameters);
    }
    return Uri.parse('$baseUrl/$url').replace(queryParameters: queryParameters);
  }

  Future<Game> getGames() async{
    final response = await _httpClient.get(getUrl(url:'games'));
    if(response.statusCode ==200){
      if(response.body.isNotEmpty){
        return Game.fromJson(json.decode(response.body));
      }else{ 
      throw ApiClientException(ApiClientExceptionType.ErrorEmptyResponse);
      }
    }else{throw ApiClientException(ApiClientExceptionType.ErrorGettingGames);
    }
  }

  Future<List<Genre>> getGenres() async{
    final response = await _httpClient.get(
      getUrl(url: 'genres')
    );
    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        return List<Genre>.from(
          json.decode(response.body)['results'].map(
            (data) => Genre.fromJson(data)
          )
        );

      }else{throw ApiClientException(ApiClientExceptionType.ErrorEmptyResponse);}

    }else{throw ApiClientException(ApiClientExceptionType.ErrorGettingGenres);}
  }
  
  Future<List<Result>> getGamesByCategory(int genreId) async{
    final response = await _httpClient.get(
      getUrl(
        url: 'games',
        extraParameters: {'genres':genreId.toString()}
        )
    );
    if(response.statusCode==200){
      if(response.body.isNotEmpty){
        return List<Result>.from(
          json.decode(response.body)['results'].map(
            (data) => Result.fromJson(data)
          )
        );
      }else{throw ApiClientException(ApiClientExceptionType.ErrorEmptyResponse);}
    }else{throw ApiClientException(ApiClientExceptionType.ErrorGettingGames);}
  }

}