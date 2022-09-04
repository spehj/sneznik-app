import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
      body:
      Container(
        child: Center(child: Text("Info")),
      )
    );
  }
}
