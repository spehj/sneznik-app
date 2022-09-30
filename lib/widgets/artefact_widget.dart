import 'package:flutter/cupertino.dart';

import '../utils/app_styles.dart';

class ArtefactImage extends StatelessWidget {
  const ArtefactImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
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
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    ]);
  }
}
