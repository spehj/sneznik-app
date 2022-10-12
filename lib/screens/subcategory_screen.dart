import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/widgets/artefact_widget.dart';
import 'package:sneznik_app/widgets/artefacts_list_view.dart';

import '../utils/app_styles.dart';

class SubcategoryScreen extends StatelessWidget {
  final String categoryId;
  final String subcategoryId;
  final String subcategoryName;
  final String subcategoryImage;
  final String subcategoryDescription;

  const SubcategoryScreen(
      {Key? key,
      required this.categoryId,
      required this.subcategoryId,
      required this.subcategoryName,
      required this.subcategoryDescription,
      required this.subcategoryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Icons.close,
                    color: Styles.whiteIconColor,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                        side:
                            BorderSide(width: 2, color: Styles.whiteIconColor)),
                    //padding: EdgeInsets.all(8),
                    backgroundColor: Styles.bgColor, // <-- Button color
                    foregroundColor: Styles.oceanBlueColor, // <-- Splash color
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // Destination title

          // Description

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_back,
                  color: Styles.whiteIconColor,
                  size: 26,
                ),
                style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.all(8),
                  backgroundColor: Styles.bgColor, // <-- Button color
                  foregroundColor: Styles.bgColor, // <-- Splash color
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward,
                  color: Styles.whiteIconColor,
                  size: 26,
                ),
                style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.all(8),
                  backgroundColor: Styles.bgColor, // <-- Button color
                  foregroundColor: Styles.bgColor, // <-- Splash color
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Line between upper menu and content
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Styles.whiteIconColor,
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
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/$subcategoryImage")),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    subcategoryName,
                    style: Styles.headlineStyle2,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subcategoryDescription,
                    style: Styles.textStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Add horizontal scroll
                  ArtefactsListView(categoryId: categoryId, subcategoryId: subcategoryId),
                  SizedBox(
                    height: 50,
                  ),
                ]),

          ),
        ]),
      ),
    );
  }
}
