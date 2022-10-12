import 'package:flutter/cupertino.dart';

import '../utils/app_styles.dart';

class ArtefactImage extends StatelessWidget {
  final double listViewHeight;
  final String artefactId;
  final String artefactName;
  final String artefactDescription;
  final String artefactImageUrl;
  const ArtefactImage({Key? key, required this.listViewHeight, required this.artefactId, required this.artefactName, required this.artefactImageUrl, required this.artefactDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        height: listViewHeight-40,
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
                  "assets/images/${artefactImageUrl}")),
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
              artefactName,
              style: Styles.headlineStyle3.copyWith(
                  color: Styles.bgColor, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              artefactDescription,
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
