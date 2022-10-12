import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/models/artefact_model.dart';

import '../utils/app_styles.dart';
import '../widgets/app_icon.dart';

class ArtefactDetail extends StatelessWidget {
  final Artefact singleArtefact;
  const ArtefactDetail({Key? key, required this.singleArtefact}) : super(key: key);
  static const int imageSize = 350;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/${singleArtefact.artefactImageUrl}"))),
                )),
            Positioned(
                top: 45,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios),
                    AppIcon(icon: Icons.favorite),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 350,
                // Same as image size (first Positioned in this Stack)
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: Styles.bgColor,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height-imageSize,
                    padding: EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        Text(
                          singleArtefact.artefactName,
                          style: Styles.headlineStyle2.copyWith(fontSize: 28),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              singleArtefact.artefactDescription,
                              style: Styles.textStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
