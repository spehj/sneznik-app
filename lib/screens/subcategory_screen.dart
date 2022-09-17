import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(top: 20, bottom: 30),
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
                          image: AssetImage(
                              "assets/images/Grad-Snežnik-00003.jpg")),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "Room 1",
                    style: Styles.headlineStyle2,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et doa aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: Styles.textStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Add horizontal scroll
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Container(
                              height: 360,
                              width: 260,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 0),
                              decoration: BoxDecoration(
                                color: Styles.greyCardColor,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/Medved-Sneznik-0002.jpg")),
                              ),
                              child: Column(
                                children: [
                                  // Container for image
                                ],
                              ),
                            ),

                            // Overlay Container
                            Container(
                              height: 100,
                              width: 230,
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED).withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sample Artifact",
                                    style: Styles.headlineStyle3.copyWith(
                                        color: Styles.bgColor, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque turpis nulla, rutrum id porttitor et, porta id ante. Curabitur sollicitudin sodales sapien a tempus. Curabitur bibendum dolor at metus interdum eleifend. Nullam vestibulum nisl nulla, ac consectetur lectus sollicitudin id. Vivamus a ullamcorper risus.",
                                    style: Styles.headlineStyle3.copyWith(
                                        color: Styles.bgColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ]),

                          // TEST
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Container(
                              height: 360,
                              width: 260,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 0),
                              decoration: BoxDecoration(
                                color: Styles.greyCardColor,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/Medved-Sneznik-0002.jpg")),
                              ),
                              child: Column(
                                children: [
                                  // Container for image
                                ],
                              ),
                            ),

                            // Overlay Container
                            Container(
                              height: 100,
                              width: 230,
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED).withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sample Artifact",
                                    style: Styles.headlineStyle3.copyWith(
                                        color: Styles.bgColor, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque turpis nulla, rutrum id porttitor et, porta id ante. Curabitur sollicitudin sodales sapien a tempus. Curabitur bibendum dolor at metus interdum eleifend. Nullam vestibulum nisl nulla, ac consectetur lectus sollicitudin id. Vivamus a ullamcorper risus.",
                                    style: Styles.headlineStyle3.copyWith(
                                        color: Styles.bgColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ]),

                          // TEST
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Container(
                              height: 360,
                              width: 260,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 0),
                              decoration: BoxDecoration(
                                color: Styles.greyCardColor,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/Medved-Sneznik-0002.jpg")),
                              ),
                              child: Column(
                                children: [
                                  // Container for image
                                ],
                              ),
                            ),

                            // Overlay Container
                            Container(
                              height: 100,
                              width: 230,
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED).withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sample Artifact",
                                    style: Styles.headlineStyle3.copyWith(
                                        color: Styles.bgColor, fontSize: 20),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque turpis nulla, rutrum id porttitor et, porta id ante. Curabitur sollicitudin sodales sapien a tempus. Curabitur bibendum dolor at metus interdum eleifend. Nullam vestibulum nisl nulla, ac consectetur lectus sollicitudin id. Vivamus a ullamcorper risus.",
                                    style: Styles.headlineStyle3.copyWith(
                                        color: Styles.bgColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      )),
                ]),
          ),
        ]),
      ),
    );
  }
}
