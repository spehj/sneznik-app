import 'package:flutter/material.dart';
import 'package:sneznik_app/screens/category_screen.dart';
import 'package:sneznik_app/utils/home_info_list.dart';
import 'package:sneznik_app/widgets/floor_card_widget.dart';

import '../models/category_model.dart';
import '../utils/app_styles.dart';
import '../utils/mocked_categories.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //List<Category> categories = Utils.getMockedCategories();

  final categories = Category.fetchAll();



  @override
  Widget build(BuildContext context) {
    print("categories length: ${categories.length}");
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
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
                      .copyWith(color: Styles.greyTextColor),
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
                  ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              print("Tapped ${categories[index].categoryName}");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>CategoryScreen(categoryName: categories[index].categoryName, categoryDescription: categories[index].categoryDescription, categoryImage: categories[index].categoryImage, categoryMap: categories[index].categoryMap,

                                  )));
                            },
                            child: FloorCard(
                                headerText: categories[index].categoryName,
                                cardImage: categories[index].categoryImage,
                                descText: categories[index].categoryDescription),
                          );
                    },
                  ),
                  // Column(
                  //     children: floorInfoList
                  //         .map((singleCard) => FloorCard(
                  //             headerText: singleCard["header"],
                  //             cardImage: singleCard["image"],
                  //             descText: singleCard["description"]))
                  //         .toList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
