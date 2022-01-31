import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:game_info_app/repository/game_repository.dart';
import 'package:game_info_app/repository/models/game.dart';

part 'all_games_event.dart';
part 'all_games_state.dart';

class AllGamesBloc extends Bloc<AllGamesEvent, AllGamesState> {

final GameRepository gameRepository;

  AllGamesBloc(
    {required this.gameRepository,}
  ) : super(const AllGamesState()) {
    on<GetGames>(_mapGetGamesEventToState);
  }

  void _mapGetGamesEventToState(
    GetGames event, Emitter<AllGamesState> emit) async{
      try {
        emit(state.copyWith(status: AllGameStatus.loading));

        final games = await gameRepository.getGames();
        emit(
          state.copyWith(
            status: AllGameStatus.success,
            games: games
          )
        );
      } catch (error) {
        emit(state.copyWith(status: AllGameStatus.error));
      }
    }
  

}
