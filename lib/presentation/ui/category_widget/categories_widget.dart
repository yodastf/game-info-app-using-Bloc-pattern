import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_info_app/presentation/ui/category_widget/bloc/category_bloc.dart';
import 'package:game_info_app/presentation/ui/category_widget/categories_success_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc,CategoryState>(
      buildWhen: (previous,current) => current.status.isSuccess,
      builder: (context,state){
        return const CategorySuccessWidget();
      }
    );
  }
}