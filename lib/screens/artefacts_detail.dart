import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../widgets/app_icon.dart';

class ArtefactDetail extends StatelessWidget {
  const ArtefactDetail({Key? key}) : super(key: key);
  static const int imageSize = 350;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/Medved-Sneznik-0002.jpg"))),
                )),
            Positioned(
                top: 45,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios),
                    AppIcon(icon: Icons.favorite),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 350,
                // Same as image size (first Positioned in this Stack)
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: Styles.bgColor,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height-imageSize,
                    padding: EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        Text(
                          "Sample artefact",
                          style: Styles.headlineStyle2.copyWith(fontSize: 28),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque turpis nulla, rutrum id porttitor et, porta id ante. Curabitur sollicitudin sodales sapien a tempus. Curabitur bibendum dolor at metus interdum eleifend. Nullam vestibulum nisl nulla, ac consectetur lectus sollicitudin id. Vivamus a ullamcorper risus. Proin vel erat tortor. Integer a eros scelerisque, dapibus lacus efficitur, dignissim neque. Suspendisse vitae odio eu ligula cursus volutpat eget non urna. Integer tortor erat, hendrerit nec magna tempor, imperdiet convallis arcu. Fusce elementum interdum velit. In eget ligula eu lectus eleifend interdum vitae at mi. Vestibulum consequat diam purus, quis facilisis odio consectetur at. Nunc eget dictum nulla. Morbi lorem ipsum, feugiat sed nulla et, euismod eleifend dolor. Quisque a sapien elementum, vulputate arcu ut, aliquam ipsum.",
                              style: Styles.textStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
