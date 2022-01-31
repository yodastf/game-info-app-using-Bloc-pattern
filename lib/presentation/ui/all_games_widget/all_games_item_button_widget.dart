
import 'package:flutter/material.dart';

class AllGamesItemButtonWidget extends StatelessWidget {
  
  final VoidCallback callback;
  const AllGamesItemButtonWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        width: 65.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.amberAccent,
        ),
        child: const Text(
          'View more',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:9.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
