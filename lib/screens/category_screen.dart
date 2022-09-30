import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/subcategory_model.dart';
import '../utils/app_styles.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final String categoryDescription;
  final String categoryMap;
  const CategoryScreen({Key? key, required this.categoryName, required this.categoryImage, required this.categoryDescription, required this.categoryMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subcategories = Subcategory.fetchSubcategories(categoryName);
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
          Row(
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back,
                    color: Styles.whiteIconColor,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                        side:
                            BorderSide(width: 2, color: Styles.whiteIconColor)),
                    //padding: EdgeInsets.all(8),
                    primary: Styles.bgColor, // <-- Button color
                    onPrimary: Styles.oceanBlueColor, // <-- Splash color
                  ),
                ),
              ),

              // TODO: change with a variable
              Text(
                categoryName,
                style: Styles.headlineStyle2,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Destination title

          // Description

          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            // TODO: fill with data from json
            child: SizedBox(
              width: double.infinity,
              child: Text(
                categoryDescription,
                style:
                    Styles.headlineStyle2.copyWith(color: Styles.greyTextColor),
                textAlign: TextAlign.start,
              ),
            ),
          ),

          // Floor plan
          Expanded(
            child: ListView(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/$categoryMap")),
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
                  Stack(children: [
                    GridView.count(
                      padding: EdgeInsets.only(top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: List.generate(6, (index) {
                        return ClipRRect(

                          borderRadius: BorderRadius.circular(20),
                          child: GridTile(
                            footer: GridTileBar(
                              backgroundColor: Styles.darkGrayColor,
                              title: Text("_subcategoryName",
                                textAlign: TextAlign.center,
                                style: Styles.headlineStyle3
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Add action
                                // Navigator.of(context).pushNamed(
                                //     BookDetailScreen.routeName,
                                //     arguments: product.id,
                                // );
                              },
                              child: Image.asset(
                                "assets/images/IMG_3278_grad_sneznik_porocna_dvorana_big.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ]),
                ]),
          )
        ]),
      ),
    );
  }
}
