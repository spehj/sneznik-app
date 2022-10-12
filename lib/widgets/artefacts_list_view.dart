import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/models/artefact_model.dart';
import 'package:sneznik_app/screens/artefacts_detail.dart';

import '../utils/app_styles.dart';
import 'artefact_widget.dart';

class ArtefactsListView extends StatefulWidget {
  final String categoryId;
  final String subcategoryId;

  const ArtefactsListView(
      {Key? key, required this.categoryId, required this.subcategoryId})
      : super(key: key);

  @override
  State<ArtefactsListView> createState() => _ArtefactsListViewState();
}

class _ArtefactsListViewState extends State<ArtefactsListView> {
  late Future<List<Artefact>> artefactFuture;

  @override
  void initState() {
    super.initState();

    artefactFuture = getArtefacts();
  }

  Future<List<Artefact>> getArtefacts() async {
    List<Artefact> artefacts = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc("YQXURRlJxRsCZpmRvhG2")
        .collection("categories")
        .doc(widget.categoryId)
        .collection("subcategories")
        .doc(widget.subcategoryId)
        .collection("artefacts");
    QuerySnapshot querySnapshot = await categoriesReference
        .orderBy("artefactPosition", descending: false)
        .get();

    var allArtefacts = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    allArtefacts.forEach((element) {
      artefacts.add(Artefact.fromJson(element));
    });
    return artefacts;
  }

  @override
  Widget build(BuildContext context) {
    const double listViewHeight = 400;
    return FutureBuilder(
        future: artefactFuture,
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: Styles.headlineStyle4.copyWith(color: Colors.white),
                  ),
                );
              } else if (snapshot.hasData) {
                List<Artefact> artefacts = snapshot.data as List<Artefact>;

                return SizedBox(
                  height: listViewHeight, // Has to be >= ArtefactImage height
                  child: ListView.builder(
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: artefacts?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Tapped ${artefacts?[index].artefactName}");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ArtefactDetail(singleArtefact: artefacts[index],)));
                          },
                          child: ArtefactImage(
                            sinlgeArtefact: artefacts[index],
                            listViewHeight: listViewHeight,
                          ),
                        );
                      }),
                );
                // return SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //         children: artefacts
                //             .map((singleArtefact) => ArtefactImage())
                //             .toList()));
              } else {
                return CircularProgressIndicator();
              }
          }
        });
  }
}
