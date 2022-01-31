part of 'all_games_bloc.dart';

enum AllGameStatus { initial, success,error,loading}

extension AllGamesStatusX on AllGameStatus{
  bool get isInitial => this == AllGameStatus.initial;
  bool get isSucces => this == AllGameStatus.success;
  bool get isError => this == AllGameStatus.error;
  bool get isLoading => this == AllGameStatus.loading;
}

class AllGamesState extends Equatable {
  
  final Game games;
  final AllGameStatus status;

  const AllGamesState(
    {
      this.status = AllGameStatus.initial,
      Game? games
    }
  ) : games = games ?? Game.empty;
  
  @override
  List<Object> get props => [status,games];

AllGamesState copyWith({
  Game? games,
  AllGameStatus? status
}){
  return AllGamesState(
    games: games ?? this.games,
    status: status ?? this.status
  );
}

}


