import 'package:flutter/cupertino.dart';
import 'package:sneznik_app/models/artefact_model.dart';
import 'package:sneznik_app/widgets/next_widget.dart';

import '../utils/app_styles.dart';

class ArtefactImage extends StatelessWidget {
  final double listViewHeight;
  final Artefact sinlgeArtefact;

  const ArtefactImage(
      {Key? key, required this.listViewHeight, required this.sinlgeArtefact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [

      Positioned(
        child: Container(
          height: listViewHeight - 40,
          width: 260,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          decoration: BoxDecoration(
            color: Styles.greyCardColor,
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/images/${sinlgeArtefact.artefactImageUrl}")),
          ),
          child: Column(
            children: [
              // Container for image
            ],
          ),
        ),
      ),
      Positioned(top: 30, right:30, child: OpenSheet()),

      // Overlay Container
      Positioned(
        bottom: 10,
        child: Container(
          height: 100,
          width: 230,
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDEDED).withOpacity(0.85),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sinlgeArtefact.artefactName,
                style: Styles.headlineStyle3
                    .copyWith(color: Styles.bgColor, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                sinlgeArtefact.artefactDescription,
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
      ),
    ]);
  }
}
