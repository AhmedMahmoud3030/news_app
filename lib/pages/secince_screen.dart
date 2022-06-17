import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit/news_cubit.dart';
import '../widgets/news_item.dart';

class SceinceScreen extends StatelessWidget {
  const SceinceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return ConditionalBuilder(
          builder: (context) => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => NewsItem(
                    list: list[index],
                  ),
              itemCount: 10),
          condition: list.length > 0,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
