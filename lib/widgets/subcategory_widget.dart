import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import 'next_widget.dart';

class SubcatCard extends StatelessWidget {
  final String? subcategoryName;
  final String? subcategoryImage;

  const SubcatCard(
      {Key? key, required this.subcategoryName, required this.subcategoryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 12),
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage("assets/images/${subcategoryImage}"))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              subcategoryName!,
              style: Styles.headlineStyle2,
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(top: 0, right: 0, child: NextCard()),
        ],
      ),
    );
  }
}
