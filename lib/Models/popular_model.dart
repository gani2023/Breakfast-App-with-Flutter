import 'dart:ui';

class PopularDietsModel {
  String name;
  String iconpath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconpath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,

  });

  static List< PopularDietsModel > getPopularDiets(){
    List< PopularDietsModel > popularDiets = [];

    popularDiets.add(
        PopularDietsModel(
            name: 'Blue Berry Pancake',
            iconpath: 'assets/Other_icons/pancakes-0058732jmcytw.svg',
            level: 'Medium',
            duration: '30 min',
            calorie: '230Kcal',
            boxIsSelected: true,
        )
    );


    popularDiets.add(
        PopularDietsModel(
            name: 'Salmon Nigiri',
            iconpath: 'assets/Other_icons/pancakes-0058732jmcytw.svg',
            level: 'Easy',
            duration: '20 min',
            calorie: '120Kcal',
            boxIsSelected: false,
        )
    );

    return popularDiets;
  }
}