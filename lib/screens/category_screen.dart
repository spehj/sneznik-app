import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/widgets/next_widget.dart';
import 'package:sneznik_app/widgets/subcategories_list_widget.dart';
import 'package:sneznik_app/widgets/subcategory_widget.dart';

import '../models/subcategory_model.dart';
import '../utils/app_styles.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String categoryImage;
  final String categoryDescription;
  final String categoryMap;

  const CategoryScreen(
      {Key? key,
      required this.categoryId,
      required this.categoryName,
      required this.categoryImage,
      required this.categoryDescription,
      required this.categoryMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final subcategories = []; //Subcategory.fetchSubcategories(categoryName);
    //print("Categories: ${subcategories}");
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Stack(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: BackWidget(
                      size: 50,
                      iconColor: Styles.whiteIconColor,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    categoryName,
                    style: Styles.headlineStyle2,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 6,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Go to category editing screen
                  EditWidget(),
                  SizedBox(
                    width: 12,
                  ),
                  // Delete category
                  DeleteWidget(),
                ],
              ),
            )
          ]),
          SizedBox(
            height: 16,
          ),
          // Floor plan
          Expanded(
            child: ListView(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        categoryDescription,
                        style: Styles.headlineStyle3
                            .copyWith(color: Styles.greyTextColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: categoryMap.isNotEmpty ? categoryMap.substring(0, 4) == "http"
                            ? NetworkImage(categoryMap)
                            : AssetImage("assets/images/$categoryMap")
                                as ImageProvider : AssetImage("assets/images/castle-floor.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Styles.whiteIconColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubcategoriesListWidget(categoryId: categoryId),
                ]),
          )
        ]),
      ),
    );
  }
}
