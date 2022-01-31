import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_info_app/presentation/ui/all_games_widget/bloc/all_games_bloc.dart';
import 'package:game_info_app/presentation/ui/category_widget/bloc/category_bloc.dart';
import 'package:game_info_app/presentation/ui/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:game_info_app/presentation/ui/home_page_widget/home_layout_widget.dart';
import 'package:game_info_app/repository/game_repository.dart';
import 'package:game_info_app/repository/service/game_service.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AllGamesBloc>(
              create: (context) => AllGamesBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(GetGames()),
            ),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(GetCategories()),
            ),
            BlocProvider<GamesByCategoryBloc>(
              create: (context) => GamesByCategoryBloc(
                gameRepository: context.read<GameRepository>(),
              ),
            ),
          ],
          child: const HomeLayOutWidget(),
        ), 
      ),
    );
  }
}