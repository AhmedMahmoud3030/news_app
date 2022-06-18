import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_Cubit/app_cubit.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/pages/search_screen.dart';
import 'package:news_app/pages/setteings_screen.dart';

import '../cubit/news_cubit/news_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                AppCubit.get(context).changeThemeMode();
              },
              icon: Icon(
                AppCubit.get(context).isDark
                    ? Icons.brightness_3_sharp
                    : Icons.brightness_7_sharp,
                color: AppCubit.get(context).isDark
                    ? Colors.deepOrange
                    : Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => SearchScreen())));
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ],
            title: Text('News App'),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeBottomNavBarIndex(value);
            },
            items: cubit.bottomItems,
            currentIndex: cubit.currentIdex,
          ),
          body: cubit.screens[cubit.currentIdex],
        );
      },
    );
  }
}
