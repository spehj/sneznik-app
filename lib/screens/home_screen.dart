import 'package:flutter/material.dart';
import 'package:sneznik_app/services/firebase_services.dart';

import '../models/category_model.dart';
import '../utils/app_styles.dart';
import '../widgets/categories_list_widget.dart';
import 'add_new_screens/add_category_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Category>> categoryFuture;

  @override
  void initState() {
    super.initState();

    categoryFuture = CategoryServices().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // Headline 1
              Row(
                children: [
                  Text(
                    "Welcome to",
                    style: Styles.headlineStyle1,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Destination title
              Row(
                children: [
                  Text(
                    "Snežnik Castle",
                    style: Styles.headlineStyle1
                        .copyWith(color: Styles.mainHeadlineColor),
                  ),
                ],
              ),

              SizedBox(
                height: 12,
              ),
              // Short destination description
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: Styles.textStyle,
              ),
              SizedBox(
                height: 12,
              ),

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  children: [
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Styles.primaryColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/sneznik-castle_1.jpg"))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Enjoy your visit!",
                          style: Styles.headlineStyle2,
                          textAlign: TextAlign.left,
                        )),
                    CategoryListWidget(categoryFuture: categoryFuture,),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 70,
            right: 20,
            child: ClipOval(
              child: Material(
                color: Styles.secondButtonColor, // Button color
                child: InkWell(
                  splashColor: Styles.secondButtonSplashColor, // Splash color
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            AddCategoryScreen(
                              category: null)),
                    ).then((value){
                      setState(() {
                        categoryFuture = CategoryServices().getCategories();
                      });

                    });
                  },
                  child: SizedBox(width: 56,
                      height: 56,
                      child: Icon(Icons.add, color: Styles.whiteIconColor,)),
                ),
              ),
            ),
          )


        ]),
      ),
    );
  }
}
