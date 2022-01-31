
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_info_app/presentation/ui/all_games_widget/all_games_success_widget.dart';
import 'package:game_info_app/presentation/ui/all_games_widget/bloc/all_games_bloc.dart';

class AllGamesWidget extends StatelessWidget {

  final String title;
  const AllGamesWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc,AllGamesState>(
      builder: (context,state){
        return state.status.isSucces 
        ? AllGamesSuccesWidget(
          games:state.games.results ,
          title: title) : state.status.isLoading 
          ?  const Center(child: CircularProgressIndicator(),
          ) : state.status.isError ? const Text('ERROR') : const SizedBox();
      }
      
      );
  }
}
