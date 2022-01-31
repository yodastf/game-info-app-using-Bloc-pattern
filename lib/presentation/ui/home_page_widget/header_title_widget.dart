import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        Column(
          children: const [
            Text('Welcome User Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            ),
            SizedBox(height: 8.0,),
            Text('What you like to play?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),)
          ],
        ),
        const SizedBox(width: 18.0,),
        const CircleAvatar(
          radius: 35,
        backgroundColor: Colors.grey,
        )
      ],

    );
  }
}