import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_info_app/presentation/ui/category_widget/bloc/category_bloc.dart';

import 'package:game_info_app/repository/models/genre.dart';

typedef CategoryClicked = Function(Genre categorySelected);

class CategoryItemWidget extends StatelessWidget {
  
  final Genre category;
  final CategoryClicked callback;

  const CategoryItemWidget({
    Key? key,
    required this.category,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(category) ,
      child: BlocSelector<CategoryBloc,CategoryState,bool>(
        selector: (state)=>
        (state.status.isSelected && state.idSelected == category.id) ? true : false,
         builder: (context,state){
           return Column(
             children: [
               AnimatedContainer(
                 duration:const Duration(milliseconds: 400),
                 curve: Curves.easeInOutCirc,
                 padding: const EdgeInsets.symmetric(horizontal: 2.0),
                 alignment: Alignment.center,
                 height: state ? 70.0 : 60.0,
                 width: state ? 70.0 : 60.0 ,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: state ? Colors.deepOrangeAccent : Colors.amberAccent
                 ),
                 child: const Icon(Icons.gamepad_outlined),
                 ),
                 const SizedBox(height: 4.0),
                 SizedBox(
                   width: 60,
                   child: Text(
                     category.name ?? '',
                     style: const TextStyle(
                       fontSize: 10.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.black87
                     ),
                     textAlign: TextAlign.center,
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 )

             ],
           );
         }
         
         ),
    );
  }
}
