import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/artefact_model.dart';
import '../utils/app_styles.dart';
import 'app_icon.dart';

class ArtefactBottomSheet extends StatelessWidget {
  final Artefact singleArtefact;

  const ArtefactBottomSheet({Key? key, required this.singleArtefact})
      : super(key: key);
  static const int imageSize = 350;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 1,
        minChildSize: 0.6,
        builder: (_, controller) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        //extendBody: true,
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
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
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    AppIcon(icon: Icons.favorite),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 320,
                // Same as image size (first Positioned in this Stack)
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Styles.bgColor,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - imageSize,
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
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            child: Text(
                              singleArtefact.artefactDescription,
                              style: Styles.textStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );
    });
  }
}
