
import 'package:flutter/material.dart';
import 'package:game_info_app/presentation/ui/games_by_category_widget/game_by_category_image.dart';

import 'package:game_info_app/repository/models/result.dart';

class GameByCategorySuccesWidget extends StatelessWidget {
  
  final String categoryName;
  final List<Result> games;
  
  const GameByCategorySuccesWidget({
    Key? key,
    required this.categoryName,
    required this.games,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 24.0,bottom: 16.0),
        child: Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
        ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child:  ListView.separated(
            padding: const EdgeInsets.only(left: 24.0,right: 24.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return GameByCategoryImageWidget(
                name: games[index].name ?? 'No data',
                backgroundimage: games[index].backgroundImage ?? ''
                );
            },
            separatorBuilder: (_,__) => const SizedBox(width: 25.0),
            itemCount: games.length
            ),
        )
      ],
    );
  }
}
