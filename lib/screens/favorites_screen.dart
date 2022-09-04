import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class FavoritesScreenScreen extends StatelessWidget {
  const FavoritesScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
      body:
      Container(
        child: Center(child: Text("Favorite")),
      )
    );
  }
}
