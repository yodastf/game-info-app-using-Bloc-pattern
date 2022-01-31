
import 'package:flutter/material.dart';
import 'package:game_info_app/presentation/ui/games_by_category_widget/game_by_category_title_widget.dart';

class GameByCategoryImageWidget extends StatelessWidget {
  
  final String name;
  final String backgroundimage;

  const GameByCategoryImageWidget({
    Key? key,
    required this.name,
    required this.backgroundimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Stack(
        children: [
          Container(
            width: 270.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(backgroundimage),
                fit:BoxFit.cover,
                colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
          ),
          Positioned(child: GameByCategoryTitle(name: name),bottom: 1.0,)
        ],
      );
  }
}
