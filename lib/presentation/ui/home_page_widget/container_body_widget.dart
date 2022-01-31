
import 'package:flutter/material.dart';

class ContainerBodyWidget extends StatelessWidget {
  final List<Widget> children;
  const ContainerBodyWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30.0),topLeft:Radius.circular(30.0)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 6,
            offset: const Offset(0,3),
          )
        ]
      ),
      child: ListView(children: children,),
      
    )
    );
  }
}
