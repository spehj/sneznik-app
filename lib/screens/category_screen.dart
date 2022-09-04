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
        child: Column(
          children: [
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
                          side: BorderSide(
                              width: 2, color: Styles.whiteIconColor)),
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
            Row(

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  // TODO: fill with data from json
                  child: Text(
                    "Description",
                    style: Styles.headlineStyle2
                        .copyWith(color: Styles.greyTextColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
