import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import 'next_widget.dart';

class FloorCard extends StatelessWidget {
  final String headerText;
  final String cardImage;
  final String descText;

  const FloorCard(
      {Key? key,
      required this.headerText,
      required this.cardImage,
      required this.descText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("cardsubs: ${cardImage.substring(0,4)} result: ${cardImage.substring(0,4) == "http"} result2: ${"http"== cardImage.substring(0,4)}");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      //padding: EdgeInsets.only(left: 20, right: 20, top:20, bottom: 12),
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            fit: BoxFit.cover,
            image: cardImage.substring(0, 4) == "http"
                ? NetworkImage(cardImage)
                : AssetImage("assets/images/${cardImage}") as ImageProvider,
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 15,
            left: 20,
            child: Text(
              headerText,
              style: Styles.headlineStyle2,
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              height: 70,
              //width: 300,
              //margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFB4B4B4).withOpacity(0.80),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                descText.length > 60
                    ? descText.substring(0, 60) + '...'
                    : descText,
                style: Styles.textStyle
                    .copyWith(fontSize: 18, color: Styles.blackTextColor),
                textAlign: TextAlign.left,
              ),
            ),

            // child: Text(
            //
            //       descText.length > 60
            //           ? descText.substring(0, 60) + '...'
            //           : descText,
            //       style: Styles.textStyle.copyWith(fontSize: 18),
            //       textAlign: TextAlign.left,
            //
            //     ),
          ),
          Positioned(top: 15, right: 20, child: NextCard()),
        ],
      ),
    );
  }
}
