import 'package:flutter/material.dart';
import 'package:game_info_app/presentation/ui/all_games_widget/all_games_widget.dart';
import 'package:game_info_app/presentation/ui/category_widget/categories_widget.dart';

import 'package:game_info_app/presentation/ui/games_by_category_widget/games_by_category_widget.dart';
import 'package:game_info_app/presentation/ui/home_page_widget/container_body_widget.dart';
import 'package:game_info_app/presentation/ui/home_page_widget/header_title_widget.dart';

class HomeLayOutWidget extends StatelessWidget {
  const HomeLayOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
           HeaderTitleWidget(),
           SizedBox(height: 40.0,),
          ContainerBodyWidget(
            children: [
              CategoryWidget(),
              GamesByCategoryWidget(),
              AllGamesWidget(title: 'All games')
            ] )

        ],
      ),
    );
  }
}