import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneznik_app/models/category_model.dart';
import 'package:sneznik_app/screens/home_screen.dart';
import 'package:sneznik_app/utils/app_styles.dart';

import '../screens/category_screen.dart';
import '../services/category_service.dart';
import '../services/firebase_services.dart';
import 'floor_card_widget.dart';

class CategoryListWidget extends StatelessWidget {
  Future<List<Category>> categoryFuture;

  CategoryListWidget({Key? key, required this.categoryFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call categoryService.getAllCategories() in home_screen
    CategoryService categoryService =
        Provider.of<CategoryService>(context, listen: false);
    List<Category> categories = categoryService.getCategories();
    print("LIST: $categories");
    return ListView.builder(
      padding: EdgeInsets.only(top: 20),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: categories.length,
      //categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              print("Tapped ${index}");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                            categoryId: categories[index].categoryId,
                            categoryName: categories[index].categoryName,
                            //categories[index].categoryName,
                            categoryDescription:
                                categories[index].categoryDescription,
                            //categories[index].categoryDescription,
                            categoryImage: categories[index].categoryImage,
                            //categories[index].categoryImage,
                            categoryMap: categories[index]
                                .categoryMap, //categories[index].categoryMap,
                          )));
            },
            child: FloorCard(
              headerText: categories[index].categoryName,
              //categories[index].categoryName,
              cardImage: categories[index].categoryImage,
              //categories[index].categoryImage,
              descText: categories[index]
                  .categoryDescription, //categories[index].categoryDescription),
            ));
      },
    );
  }
}
