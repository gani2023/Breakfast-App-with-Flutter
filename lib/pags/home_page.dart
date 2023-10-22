import 'package:beginner_to_junior/Models/Category_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Models/diet_model.dart';
import '../Models/popular_model.dart';

class HOMEPAGE extends StatefulWidget {
  HOMEPAGE({Key? key}) : super(key: key);

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {


  List<Category_model> categories = [];
  List<DietModel> diets = [];
  List< PopularDietsModel > popularDiets = [];


  void _getinitialinfo() {
    categories = Category_model.getCategories();
    diets = DietModel.getdiets();
    popularDiets = PopularDietsModel.getPopularDiets();

  }


  @override
  void initState(){
    _getinitialinfo();
  }

  @override
  Widget build(BuildContext context) {
    _getinitialinfo();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchfield(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          _dietSection(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 15,),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100 ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(popularDiets[index].iconpath,
                            height: 65,
                            width: 65,),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black ,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                popularDiets[index].duration + ' | ' + popularDiets[index].calorie + ' | ' + popularDiets[index].calorie,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400 ,
                                  color: Color(0xff7B6F72),
                                ),
                              )
                            ],
                          ),

                          GestureDetector(
                            onTap: (){

                            },
                            child: SvgPicture.asset(
                              'assets/Icons_part_3/next-svgrepo-com.svg',
                              height: 30,
                              width: 30,
                            ),
                          )

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [ BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0,10),
                          blurRadius: 40,
                          spreadRadius: 0.0,
                        ),
                    ]
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: popularDiets.length,
                  separatorBuilder: (context,index) => const SizedBox(height: 25,),
              padding: const EdgeInsets.only(left: 20, right: 20,),)
            ],
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Recommendation \nFor Diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              color: Colors.white,
              height: 240,
              child: ListView.separated(
                  itemBuilder: (context,index) {
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: diets[index].boxcolor.withOpacity(0.3),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(diets[index].iconpath,
                              height: 120, width: 120,
                          ),

                          Column(
                            children: [
                              Text(
                                diets[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                              ),
                              ),
                              Text(
                                diets[index].level + ' | ' +  diets[index].duration + ' | ' + diets[index].calorie,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7B6F72),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600 ,
                                  fontSize: 14,
                                  color: diets[index].ViewIsSelected ? Colors.white : const Color(0xffC58BF2),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  diets[index].ViewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                                  diets[index].ViewIsSelected ? const Color(0xff92A3FD) : Colors.transparent,
                                ]
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context , index) => const SizedBox(width: 25,),
                  itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
              ),
            )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 150,
              color: Colors.white,
               child: ListView.separated(
                 itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  separatorBuilder: (context , index) => const SizedBox(width: 25,),
                  itemBuilder: (context,index){
                    return Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: categories[index].boxcolor.withOpacity(0.3)
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  SvgPicture.asset(categories[index].iconpath),
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    );
                  },
              ),
            )
          ],
        );
  }

  Container _searchfield() {
    return Container(
          margin: const EdgeInsets.only(left:20 ,top:40 ,right:20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search Pancake',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 10,
                    width: 10,
                    child: SvgPicture.asset('assets/icons/search-svgrepo-com.svg')),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end ,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 28,
                          width: 28,
                          child: SvgPicture.asset('assets/icons/filter.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              )
            ),
          ),
        );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
          'Breakfast',
      style: TextStyle(
          color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
    ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){

        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/right-arrow copy.svg',
          height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),

      actions: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset('assets/icons/three-dots.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ],
    );
  }
}
