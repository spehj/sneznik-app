import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/models/subcategory_model.dart';
import 'package:sneznik_app/screens/subcategory_list_screen.dart';
import 'package:sneznik_app/screens/subcategory_screen.dart';
import 'package:sneznik_app/widgets/subcategory_widget.dart';

import '../screens/category_screen.dart';
import '../utils/app_styles.dart';

class SubcategoriesListWidget extends StatefulWidget {
  final String categoryId;

  const SubcategoriesListWidget({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<SubcategoriesListWidget> createState() =>
      _SubcategoriesListWidgetState();
}

class _SubcategoriesListWidgetState extends State<SubcategoriesListWidget> {
  late Future<List<Subcategory>> subcategoryFuture;

  @override
  void initState() {
    super.initState();

    subcategoryFuture = getSubcategories();
  }

  Future<List<Subcategory>> getSubcategories() async {
    List<Subcategory> subcategories = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc("YQXURRlJxRsCZpmRvhG2")
        .collection("categories")
        .doc(widget.categoryId)
        .collection("subcategories");

    QuerySnapshot querySnapshot = await categoriesReference
        .orderBy("subcategoryPosition", descending: false)
        .get();
    var allSubcategories = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    allSubcategories.forEach((element) {
      subcategories.add(Subcategory.fromJson(element));
    });
    return subcategories;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: subcategoryFuture,
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
                List<Subcategory> subcategories =
                    snapshot.data as List<Subcategory>;

                return ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: subcategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          print(
                              "Tapped ${subcategories[index].subcategoryName}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubcategoryListScreen(categoryId: widget.categoryId, subcategories: subcategories, tappedIndex: index,)
                                      // SubcategoryScreen(
                                      //   subcategoryName: subcategories[index]
                                      //       .subcategoryName,
                                      //   subcategoryDescription:
                                      //       subcategories[index]
                                      //           .subcategoryDescription,
                                      //   subcategoryImage: subcategories[index]
                                      //       .subcategoryImageUrl,
                                      //   subcategoryId:
                                      //       subcategories[index].subcategoryId,
                                      //   categoryId: widget.categoryId,
                                      // )
                              ));
                        },
                        child: SubcatCard(
                          subcategoryName:
                              subcategories[index].subcategoryName,
                          subcategoryImage:
                              subcategories[index].subcategoryImageUrl,
                        ));
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
          }
        });
  }
}
