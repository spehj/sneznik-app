import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class NextCard extends StatelessWidget {
  const NextCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Styles.oceanBlueColor,
      ),
      child: Icon(Icons.chevron_right_rounded, color: Colors.white, size: 30,),
    );
  }
}
