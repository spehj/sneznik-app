import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/artefact_model.dart';
import '../models/subcategory_model.dart';

class SubcategoryServices {
  Future<List<Subcategory>> getSubcategories(categoryId) async {
    List<Subcategory> subcategories = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc("YQXURRlJxRsCZpmRvhG2")
        .collection("categories")
        .doc(categoryId)
        .collection("subcategories");

    QuerySnapshot querySnapshot = await categoriesReference
        .orderBy("subcategoryPosition", descending: false)
        .get();
    var allSubcategories = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    for (var element in allSubcategories) {
      subcategories.add(Subcategory.fromJson(element));
    }
    return subcategories;
  }
}

// class ArtefactServices {
//   Future<List<Artefact>> getArtefacts(categoryId, subcategoryId) async {
//     List<Artefact> artefacts = [];
//     CollectionReference categoriesReference = FirebaseFirestore.instance
//         .collection("museum")
//         .doc("YQXURRlJxRsCZpmRvhG2")
//         .collection("categories")
//         .doc(categoryId)
//         .collection("subcategories")
//         .doc(subcategoryId)
//         .collection("artefacts");
//     QuerySnapshot querySnapshot = await categoriesReference
//         .orderBy("artefactPosition", descending: false)
//         .get();
//
//     var allArtefacts = querySnapshot.docs
//         .map((doc) => doc.data() as Map<String, dynamic>)
//         .toList();
//
//     allArtefacts.forEach((element) {
//       artefacts.add(Artefact.fromJson(element));
//     });
//     return artefacts;
//   }
// }

class ArtefactService {
  FirebaseFirestore? instance;
  List<Artefact> artefacts = [];

  // List<Artefact> getArtefacts() {
  //   return artefacts;
  // }

  Future<List<Artefact>> getArtefacts(categoryId, subcategoryId) async {
    List<Artefact> artefacts = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc("YQXURRlJxRsCZpmRvhG2")
        .collection("categories")
        .doc(categoryId)
        .collection("subcategories")
        .doc(subcategoryId)
        .collection("artefacts");
    QuerySnapshot querySnapshot = await categoriesReference
        .orderBy("artefactPosition", descending: false)
        .get();

    var allArtefacts = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    for (var element in allArtefacts) {
      artefacts.add(Artefact.fromJson(element));
    }
    return artefacts;
  }



  Future<void> getArtefactsCollection(categoryId, subcategoryId) async {
    List<Artefact> newartefacts = [];
    instance = FirebaseFirestore.instance;
    CollectionReference collectionReference = instance!
        .collection("museum")
        .doc("YQXURRlJxRsCZpmRvhG2")
        .collection("categories")
        .doc(categoryId)
        .collection("subcategories")
        .doc(subcategoryId)
        .collection("artefacts");
    print("subcategory: ${subcategoryId}");
    QuerySnapshot querySnapshot = await collectionReference.get();
    var allArtefacts = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    for (var element in allArtefacts) {
      newartefacts.add(Artefact.fromJson(element));
    }
    artefacts = newartefacts;
    print("subcategory: ${subcategoryId} has artefacts: ${artefacts}");

  }

}
