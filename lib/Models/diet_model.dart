import 'dart:ui';

class DietModel {
  String name;
  String iconpath;
  String level;
  String duration;
  String calorie;
  bool ViewIsSelected;
  Color boxcolor;

  DietModel({
    required this.name,
    required this.iconpath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.ViewIsSelected,
    required this.boxcolor,

  });

  static List<DietModel> getdiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
          name: 'Honey Pancake',
          iconpath: 'assets/Other_icons/pancakes-0058732jmcytw.svg',
          level: 'Easy',
          duration: '30 min',
          calorie: '180kcal',
          ViewIsSelected: true,
          boxcolor: Color(0xffC58BF2),
      )
    );

    diets.add(
        DietModel(
            name: 'Canai Bread',
            iconpath: 'assets/Other_icons/bread.svg',
            level: 'Easy',
            duration: '20 min',
            calorie: '230Kcal',
            ViewIsSelected: false,
            boxcolor: Color(0xff92A3FD),
        )
    );


    return diets;
  }

}