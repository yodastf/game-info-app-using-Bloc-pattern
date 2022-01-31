
import 'package:flutter/material.dart';
import 'package:game_info_app/presentation/ui/all_games_widget/all_games_item_button_widget.dart';
import 'package:game_info_app/presentation/ui/all_games_widget/all_games_item_image_wiget.dart';

import 'package:game_info_app/repository/models/result.dart';

class AllGamesItemWidget extends StatelessWidget {
  
  final Result game;
  const AllGamesItemWidget({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color:Colors.grey.withOpacity(.1),
      ),
      child: Stack(
        children: [
          Positioned(
            left:20.0,
            top: 15.0,
            bottom: 15.0,
            child: AllGamesItemImageWidget(backgroundImage: game.backgroundImage ?? ''),
          ),
          Positioned(
            top: 25,
            left: 100,
            child:SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                game.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ),
          Positioned(
            left: 100,
            top:45,
            child: Text(
              game.genres?.first.name ?? '',
              style: const TextStyle(fontSize: 12),
            )
            ),
            Positioned(
              top: 65,
              left: 100,
              child: Text(
                '${game.rating ?? 0.0}',
                style: const TextStyle(fontSize: 12),
                ),
                
                ),
                
                Positioned(
              top: 45,
              left: 280,
              child: AllGamesItemButtonWidget(
                callback: () {}
                )
                ),
          
        ],
      ),
    );
  }
}
