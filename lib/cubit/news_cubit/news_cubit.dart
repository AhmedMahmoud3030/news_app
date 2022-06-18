import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/pages/busniess_screen.dart';
import 'package:news_app/pages/secince_screen.dart';
import 'package:news_app/pages/sports_screen.dart';

import '../../network/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIdex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: 'Science',
      icon: Icon(
        Icons.science,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Sports',
      icon: Icon(
        Icons.sports_football,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(
        Icons.business,
      ),
    ),
  ];
  List<Widget> screens = [
    SceinceScreen(),
    SportsScreen(),
    BusniessScreen(),
  ];
  void changeBottomNavBarIndex(int index) {
    currentIdex = index;

    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getBusiness();
    }

    emit(NewsBottomNavState());
  }

///////////////////////////////////////////////
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '1bbff2b420804c45844b7a1974af7e54',
        },
      ).then(
        (value) {
          sports = value!.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        },
      ).catchError(
        (err) {
          print(err.toString());
          emit(NewsGetSportsErrorState(err.toString()));
        },
      );
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

///////////////////////////////////////////////
  List<dynamic> business = [];

  getAllData() {
    getScience();
    getSports();
    getBusiness();
  }

  void getBusiness() {
    emit(NewsGetBusniessLoadingState());

    if (business.length == 0) {
      DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '1bbff2b420804c45844b7a1974af7e54',
        },
      ).then(
        (value) {
          business = value!.data['articles'];
          print(business[0]['title']);
          emit(NewsGetBusniessSuccessState());
        },
      ).catchError(
        (err) {
          print(err.toString());
          emit(NewsGetBusniessErrorState(err.toString()));
        },
      );
    } else {
      emit(NewsGetBusniessSuccessState());
    }
  }

///////////////////////////////////////////////
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetSecinceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '1bbff2b420804c45844b7a1974af7e54',
        },
      ).then(
        (value) {
          science = value!.data['articles'];
          print(science[0]['title']);
          emit(NewsGetSecinceSuccessState());
        },
      ).catchError(
        (err) {
          print(err.toString());
          emit(NewsGetSecinceErrorState(err.toString()));
        },
      );
    } else {
      emit(NewsGetSecinceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    if (search.length == 0) {
      DioHelper.getData(
        url: '/v2/everything',
        query: {
          'q': '${value}',
          'apiKey': '1bbff2b420804c45844b7a1974af7e54',
        },
      ).then(
        (value) {
          search = value!.data['articles'];
          print(search[0]['title']);
          emit(NewsGetSearchSuccessState());
        },
      ).catchError(
        (err) {
          print(err.toString());
          emit(NewsGetSearchErrorState(err.toString()));
        },
      );
    } else {
      emit(NewsGetSecinceSuccessState());
    }
  }
}
///////////////////////////////////////////////
  

