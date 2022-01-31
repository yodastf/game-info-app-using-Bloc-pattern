import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_info_app/presentation/ui/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:game_info_app/presentation/ui/games_by_category_widget/game_by_category_success_widget.dart';

class GamesByCategoryWidget extends StatelessWidget {
  const GamesByCategoryWidget
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc,GamesByCategoryState>(
      builder: (context,state){

        return state.status.isSuccess ? GameByCategorySuccesWidget(
          categoryName: state.categoryName,
          games: state.games
          ) : state.status.isLoading ? const Center(child: CircularProgressIndicator(),
          ) : state.status.isError ? const Center(child: Text('Error')) : const SizedBox();


      }
      
      );
  }
}