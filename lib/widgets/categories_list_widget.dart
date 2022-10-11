import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/models/category_model.dart';
import 'package:sneznik_app/utils/app_styles.dart';

import '../screens/category_screen.dart';
import 'floor_card_widget.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late Future<List<Category>> categoryFuture;

  @override
  void initState() {
    super.initState();

    categoryFuture = getCategories();
  }

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc("YQXURRlJxRsCZpmRvhG2")
        .collection("categories");

    QuerySnapshot querySnapshot = await categoriesReference.orderBy("categoryPosition", descending: false).get();

    // Then create new category instances with factory method
    var allCategories = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    //print("All data: ${allCategories.runtimeType}");
    allCategories.forEach((element) {
      categories.add(Category.fromJson(element));
    });
    //print("Categories: ${categories.length}");
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoryFuture,
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: Styles.headlineStyle4.copyWith(color: Colors.white),
                  ),
                );
              } else if (snapshot.hasData) {
                List<Category> categories = snapshot.data as List<Category>;
                // print("Categories: ${categories.length}");
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
                                        categoryName:
                                            categories[index].categoryName,
                                        //categories[index].categoryName,
                                        categoryDescription: categories[index]
                                            .categoryDescription,
                                        //categories[index].categoryDescription,
                                        categoryImage:
                                            categories[index].categoryImage,
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
              } else {
                //print("Here ...");
                return CircularProgressIndicator();
              }
          }
        });
  }
}
