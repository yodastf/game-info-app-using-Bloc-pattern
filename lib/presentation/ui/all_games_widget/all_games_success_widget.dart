
import 'package:flutter/material.dart';
import 'package:game_info_app/presentation/ui/all_games_widget/all_games_item_widget.dart';

import 'package:game_info_app/repository/models/result.dart';

class AllGamesSuccesWidget extends StatelessWidget {
  
  final List<Result> games;
  final String title;
  const AllGamesSuccesWidget({
    Key? key,
    required this.games,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold),
          ),
        ),
        SizedBox(
          height: ((100 * games.length) + MediaQuery.of(context).size.width) + 24,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left:24,right:24,top:24),
            itemBuilder: (context,index){
              return AllGamesItemWidget(game: games[index]);
            }, 
            separatorBuilder: (_,__) => const SizedBox(height: 20), 
            itemCount: games.length),
        )
      ],
    );
  }
}
