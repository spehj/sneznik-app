import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneznik_app/models/category_model.dart';
import 'package:sneznik_app/screens/home_screen.dart';
import 'package:sneznik_app/utils/app_styles.dart';

import '../screens/category_screen.dart';
import '../services/firebase_services.dart';
import 'floor_card_widget.dart';

class CategoryListWidget extends StatelessWidget {
  Future<List<Category>> categoryFuture;
  CategoryListWidget({Key? key, required this.categoryFuture}) : super(key: key);

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
                // Save current number of categories
                Provider.of<NumberOfCategoriesService>(context).changeNumberOfCategories(categories.length);
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
                              // MaterialPageRoute(
                              //     builder: (context) => CategoryScreen(
                              //       categoryId: categories[index].categoryId,
                              //           categoryName:
                              //               categories[index].categoryName,
                              //           //categories[index].categoryName,
                              //           categoryDescription: categories[index]
                              //               .categoryDescription,
                              //           //categories[index].categoryDescription,
                              //           categoryImage:
                              //               categories[index].categoryImage,
                              //           //categories[index].categoryImage,
                              //           categoryMap: categories[index]
                              //               .categoryMap, //categories[index].categoryMap,
                              //         ))
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                    category: categories[index], //categories[index].categoryMap,
                                  ))

                          );
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

// late Future<List<Category>> categoryFuture;
// bool _isExecuted = false;
// @override
// void initState() {
//   super.initState();
//   print("INSIDE INIT");
//
//   categoryFuture = getCategories();
// }
//
// Future<List<Category>> getCategories() async {
//   List<Category> categories = [];
//   CollectionReference categoriesReference = FirebaseFirestore.instance
//       .collection("museum")
//       .doc("YQXURRlJxRsCZpmRvhG2")
//       .collection("categories");
//
//   QuerySnapshot querySnapshot = await categoriesReference.orderBy("categoryPosition", descending: false).get();
//
//   // Then create new category instances with factory method
//   var allCategories = querySnapshot.docs
//       .map((doc) => doc.data() as Map<String, dynamic>)
//       .toList();
//
//   //print("All data: ${allCategories.runtimeType}");
//   allCategories.forEach((element) {
//     categories.add(Category.fromJson(element));
//   });
//   Provider.of<NumberOfCategories>(context, listen: false).changeNumberOfCategories(categories.length.toDouble());
//   print("-->>>>> Categories: ${categories.length}");
//   return categories;
// }