import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                "First Floor",
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
            padding: const EdgeInsets.only(left: 12),
            // TODO: fill with data from json
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Description",
                style:
                    Styles.headlineStyle2.copyWith(color: Styles.greyTextColor),
                textAlign: TextAlign.start,
              ),
            ),
          ),

          // Floor plan
          Expanded(
            child: ListView(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(10, (index) {
                        return Center(
                          child: Text(
                            'Item $index',
                            style: Styles.textStyle,
                          ),
                        );
                      }),
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
