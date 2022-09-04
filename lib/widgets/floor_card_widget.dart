import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class FloorCard extends StatelessWidget {
  final String headerText;
  final String cardImage;
  final String descText;
  const FloorCard({Key? key, required this.headerText, required this.cardImage, required this.descText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      padding: EdgeInsets.only(left: 20, right: 20, top:20, bottom: 12),
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/${cardImage}"))
      ),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                headerText,
                style: Styles.headlineStyle2,
                textAlign: TextAlign.left,
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: Text(
                descText.length > 60
                    ? descText.substring(0, 60) + '...'
                    : descText,
                style: Styles.textStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.left,

              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Discover more"),
            style: ElevatedButton.styleFrom(
                primary: Styles.oceanBlueColor,
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          )
        ],
      ),
    );
  }
}
