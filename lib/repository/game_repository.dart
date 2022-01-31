
import 'package:game_info_app/repository/models/game.dart';
import 'package:game_info_app/repository/models/genre.dart';
import 'package:game_info_app/repository/models/result.dart';
import 'package:game_info_app/repository/service/game_service.dart';

class GameRepository{
  final GameService service;

  GameRepository({required this.service});

  Future<Game> getGames() async => service.getGames();

  Future<List<Genre>> getGenres() async => service.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) async => service.getGamesByCategory(genreId);
}