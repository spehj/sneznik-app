import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/widgets/next_widget.dart';
import 'package:sneznik_app/widgets/subcategories_list_widget.dart';

import '../models/category_model.dart';
import '../services/firebase_services.dart';
import '../utils/app_styles.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen(
      {Key? key,
        required this.category
      })
      : super(key: key);


  // Future<void> deleteCategory(String categoryId) async{
  //   await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
  //     await myTransaction.delete(snapshot.data.documents[index].reference);
  //   });
  //
  // }

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
                    category.categoryName,
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
                  GestureDetector(child: DeleteWidget(), onTap: ()async{
                    print("tap deltet");
                    await CategoryServices().deleteCategory(category.categoryId);
                  },),
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
                        category.categoryDescription,
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
                        image: category.categoryMap.isNotEmpty ? category.categoryMap.substring(0, 4) == "http"
                            ? NetworkImage(category.categoryMap)
                            : AssetImage("assets/images/${category.categoryMap}")
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
                  SubcategoriesListWidget(categoryId: category.categoryId),
                ]),
          )
        ]),
      ),
    );
  }
}
