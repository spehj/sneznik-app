import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneznik_app/models/artefact_model.dart';
import 'package:sneznik_app/services/firebase_services.dart';
import 'package:sneznik_app/widgets/next_widget.dart';

import '../models/subcategory_model.dart';
import '../utils/app_styles.dart';
import '../widgets/artefact_bottom_sheet.dart';
import '../widgets/artefact_widget.dart';
import '../widgets/artefacts_list_view.dart';
import '../widgets/subcategory_widget.dart';

class SubcategoryListScreen extends StatefulWidget {
  final List<Subcategory> subcategories;
  final String categoryId;
  final int tappedIndex;

  const SubcategoryListScreen(
      {Key? key,
      required this.categoryId,
      required this.subcategories,
      required this.tappedIndex})
      : super(key: key);

  @override
  State<SubcategoryListScreen> createState() => _SubcategoryListScreenState();
}

class _SubcategoryListScreenState extends State<SubcategoryListScreen> {
  late Future<List<Artefact>> artefactFuture;
  int subcategoryIndex = 0;
  int subcategoriesLength = 0;

  @override
  void initState() {
    super.initState();
    subcategoryIndex = widget.tappedIndex;
    subcategoriesLength = widget.subcategories.length;
    artefactFuture = ArtefactService().getArtefacts(widget.categoryId,
        widget.subcategories[subcategoryIndex].subcategoryId);
  }

  @override
  Widget build(BuildContext context) {
    const double listViewHeight = 400;

    /// Provider is not needed
    // ArtefactService artefactService = Provider.of<ArtefactService>(context, listen: false);
    // // Future.wait();
    // artefactService.getArtefactsCollection(widget.categoryId, widget.subcategories[subcategoryIndex].subcategoryId);
    // artefactService
    //     .getArtefactsCollection(widget.categoryId,
    //         widget.subcategories[subcategoryIndex].subcategoryId);
    // artefacts = artefactService.getArtefacts();

    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 16, right: 16, top: 12),
          // Upper MENU
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    // Back button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Styles.whiteIconColor,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 2, color: Styles.whiteIconColor)),
                        //padding: EdgeInsets.all(8),
                        backgroundColor: Styles.bgColor, // <-- Button color
                        foregroundColor:
                            Styles.oceanBlueColor, // <-- Splash color
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // Destination title

              // Description
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: !(subcategoryIndex == 0),
                      child: GestureDetector(
                          onTap: () {
                            subcategoryIndex -= 1;
                            setState(() {
                              artefactFuture = ArtefactService().getArtefacts(
                                  widget.categoryId,
                                  widget.subcategories[subcategoryIndex]
                                      .subcategoryId);
                            });
                          },
                          child: BackWidget(iconColor: Styles.whiteIconColor))

                      // ElevatedButton(
                      //   onPressed: () {
                      //     subcategoryIndex -= 1;
                      //     setState(() {
                      //       print("Sub index: $subcategoryIndex");
                      //       artefactFuture = ArtefactService().getArtefacts(
                      //           widget.categoryId,
                      //           widget.subcategories[subcategoryIndex]
                      //               .subcategoryId);
                      //     });
                      //   },
                      //   child: Icon(
                      //     Icons.chevron_left_rounded,
                      //     color: Styles.whiteIconColor,
                      //     size: 26,
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     //padding: EdgeInsets.all(8),
                      //     backgroundColor: Styles.bgColor, // <-- Button color
                      //     foregroundColor: Styles.bgColor, // <-- Splash color
                      //   ),
                      // ),
                      ),
                  Visibility(
                    visible: subcategoryIndex < (subcategoriesLength - 1),
                    child: GestureDetector(
                        onTap: () {
                          subcategoryIndex += 1;
                          setState(() {
                            artefactFuture = ArtefactService().getArtefacts(
                                widget.categoryId,
                                widget.subcategories[subcategoryIndex]
                                    .subcategoryId);
                          });
                        },
                        child: FwdWidget(iconColor: Styles.whiteIconColor))


                    // ElevatedButton(
                    //   onPressed: () {
                    //     subcategoryIndex += 1;
                    //     setState(() {
                    //       print("Sub index: $subcategoryIndex");
                    //       artefactFuture = ArtefactService().getArtefacts(
                    //           widget.categoryId,
                    //           widget.subcategories[subcategoryIndex]
                    //               .subcategoryId);
                    //     });
                    //   },
                    //   child: Icon(
                    //     Icons.chevron_right_rounded,
                    //     color: Styles.whiteIconColor,
                    //     size: 26,
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     //padding: EdgeInsets.all(8),
                    //     backgroundColor: Styles.bgColor, // <-- Button color
                    //     foregroundColor: Styles.bgColor, // <-- Splash color
                    //   ),
                    // ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Line between upper menu and content
              Container(
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Styles.whiteIconColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// Bottom part under white line
              Expanded(
                child: ListView(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/${widget.subcategories[subcategoryIndex].subcategoryImageUrl}")),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        widget.subcategories[subcategoryIndex].subcategoryName,
                        style: Styles.headlineStyle2,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.subcategories[subcategoryIndex]
                            .subcategoryDescription,
                        style: Styles.textStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Add horizontal scroll
                      // ArtefactsListView(
                      //     categoryId: widget.categoryId,
                      //     subcategoryId: widget
                      //         .subcategories[subcategoryIndex].subcategoryId),

                      FutureBuilder(
                          future: artefactFuture,
                          builder: (BuildContext context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Center(
                                    child: CircularProgressIndicator());
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      "Error: ${snapshot.error}",
                                      style: Styles.headlineStyle4
                                          .copyWith(color: Colors.white),
                                    ),
                                  );
                                } else if (snapshot.hasData) {
                                  List<Artefact> artefacts =
                                      snapshot.data as List<Artefact>;
                                  if (artefacts.length != 0) {
                                    return SizedBox(
                                      height: listViewHeight,
                                      // Has to be >= ArtefactImage height

                                      child: ListView.builder(
                                          //shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: artefacts.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                print(
                                                    "Tapped ${artefacts[index].artefactName}");
                                                // Commented
                                                //Navigator.push(context, MaterialPageRoute(builder: (context) => ArtefactDetail(singleArtefact: artefacts[index],)));
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return ArtefactBottomSheet(
                                                        singleArtefact:
                                                            artefacts[index],
                                                      );
                                                    });
                                              },
                                              child: ArtefactImage(
                                                sinlgeArtefact:
                                                    artefacts[index],
                                                listViewHeight: listViewHeight,
                                              ),
                                            );
                                          }),
                                    );
                                  } else {
                                    // If there is no artefacts to show, don't show anything
                                    return SizedBox(
                                      height: 30,
                                    );
                                  }
                                } else {
                                  return CircularProgressIndicator();
                                }
                            }
                          }),

                      /// BACKUP
                      // child: ListView.builder(
                      //     //shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: artefacts.length,
                      //     itemBuilder: (context, index) {
                      //       return GestureDetector(
                      //         onTap: () {
                      //           print(
                      //               "Tapped ${artefacts[index].artefactName}");
                      //           // Commented
                      //           //Navigator.push(context, MaterialPageRoute(builder: (context) => ArtefactDetail(singleArtefact: artefacts[index],)));
                      //           showModalBottomSheet(
                      //               isScrollControlled: true,
                      //               backgroundColor: Colors.transparent,
                      //               context: context,
                      //               builder: (context) {
                      //                 return ArtefactBottomSheet(
                      //                   singleArtefact: artefacts[index],
                      //                 );
                      //               });
                      //         },
                      //         child: ArtefactImage(
                      //           sinlgeArtefact: artefacts[index],
                      //           listViewHeight: listViewHeight,
                      //         ),
                      //       );
                      //     }),

                      SizedBox(
                        height: 50,
                      ),
                    ]),
              ),

              // END TODO
            ],
          ),
        ));
  }
}
