import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit/news_cubit.dart';

import '../widgets/news_item.dart';
import '../widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchInput(
                  hintText: 'serach news',
                  textController: searchController,
                  onChanged: (String val) {
                    NewsCubit.get(context).getSearch(val);
                  },
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  builder: (context) => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => NewsItem(
                            list: list[index],
                          ),
                      itemCount: 10),
                  condition: list.length > 0,
                  fallback: (context) => Center(
                    child: Container(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
