import 'package:flutter/material.dart';
import 'package:sneznik_app/utils/home_info_list.dart';
import 'package:sneznik_app/widgets/floor_card_widget.dart';

import '../utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


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
            // Headline 1
            Row(
              children: [
                Text(
                  "Welcome to",
                  style: Styles.headlineStyle1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Destination title
            Row(
              children: [
                Text(
                  "Snežnik Castle",
                  style: Styles.headlineStyle1
                      .copyWith(color: Styles.greyTextColor),
                ),
              ],
            ),

            SizedBox(
              height: 12,
            ),
            // Short destination description
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
              style: Styles.textStyle,
            ),

            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 30, bottom: 30),
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Styles.primaryColor,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/sneznik-castle_1.jpg"))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Enjoy your visit!",
                        style: Styles.headlineStyle2,
                        textAlign: TextAlign.left,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      children: floorInfoList
                          .map((singleCard) => FloorCard(
                              headerText: singleCard["header"],
                              cardImage: singleCard["image"],
                              descText: singleCard["description"]))
                          .toList())
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}
