import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class SubcatCard extends StatelessWidget {
  final String subcategoryName;
  final String subcategoryImage;
  const SubcatCard({Key? key, required this.subcategoryName, required this.subcategoryImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      padding: EdgeInsets.only(left: 20, right: 20, top:20, bottom: 12),
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/${subcategoryImage}"))
      ),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                subcategoryName,
                style: Styles.headlineStyle2,
                textAlign: TextAlign.left,
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Discover more"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Styles.oceanBlueColor,
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
