import 'package:flutter/material.dart';

class Category_model {
  String name;
  String iconpath;
  Color boxcolor;


  Category_model ({
    required this.name,
    required this.iconpath,
    required this.boxcolor,
});

  static List<Category_model> getCategories() {
    List<Category_model> categories = [];
    
    categories.add(Category_model(
        name: 'Salad',
        iconpath: 'assets/Other_icons/salad.svg',
        boxcolor: Color(0xff92A3FD))
    );

    categories.add(Category_model(
        name: 'Cake',
        iconpath: 'assets/Other_icons/birthday-cake.svg',
        boxcolor: Color(0xffC58BF2))
    );

    categories.add(Category_model(
        name: 'Pie',
        iconpath: 'assets/Other_icons/pie.svg',
        boxcolor: Color(0xff92A3FD))
    );


    return categories;
  }
}