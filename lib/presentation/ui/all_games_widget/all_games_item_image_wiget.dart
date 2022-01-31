

import 'package:flutter/material.dart';

class AllGamesItemImageWidget extends StatelessWidget {
  
  final String backgroundImage;
  const AllGamesItemImageWidget({
    Key? key,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
           image: DecorationImage(image: NetworkImage(backgroundImage),
           fit: BoxFit.cover
      ),
      )
    );
  }
}
