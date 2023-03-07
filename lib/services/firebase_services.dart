import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:sneznik_app/models/category_model.dart';

import '../models/artefact_model.dart';
import '../models/subcategory_model.dart';
import '../screens/home_screen.dart';
import '../utils/constants.dart';

class CategoryServices {


  Future createCategory(
      {required String categoryName,
      required String categoryImage,
      required String categoryDescription,
      required String categoryMap,
      required int categoryPosition}) async {
    // TODO: Add organization as top level collection

    final categoryDocument = FirebaseFirestore.instance
        .collection("museum")
        .doc(Constants.museumDocId)
        .collection("categories")
        .doc();
    final category = Category(
        categoryId: categoryDocument.id,
        categoryName: categoryName,
        categoryDescription: categoryDescription,
        categoryImage: categoryImage,
        categoryMap: categoryMap,
        categoryPosition: categoryPosition);

    final json = category.toJson();

    await categoryDocument.set(json);
  }

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc(Constants.museumDocId)
        .collection("categories");

    QuerySnapshot querySnapshot = await categoriesReference
        .orderBy("categoryPosition", descending: false)
        .get();

    // Then create new category instances with factory method
    var allCategories = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    //print("All data: ${allCategories.runtimeType}");
    for (var element in allCategories) {
      categories.add(Category.fromJson(element));
    }
    return categories;
  }



  Future<void> deleteCategoryImage(String url) async{
    try {
      await FirebaseStorage.instance.refFromURL(url).delete();
    } catch (e) {
      print("Error deleting db from cloud: $e");
    }
  }

  /// Delete category
  Future<void> deleteCategory(String categoryId) async{
    print("Delete");
    DocumentReference documentReference = FirebaseFirestore.instance.collection("museum")
        .doc(Constants.museumDocId)
        .collection("categories").doc(categoryId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    var documentData = documentSnapshot.data();
    print("DOC DATA: ${documentData}");
    /// TODO: add delete
    // if(documentData["categoryImageUrl"] != null){
    //   String mainImage = documentData?["categoryImageUrl"];
    // }
    //
    //
    // // await deleteCategoryImage()
    // FirebaseFirestore.instance.runTransaction((transaction) async =>
    // await transaction.delete(documentReference));
    // print("Category Deleted");
  }
  
  
  
}

class NumberOfCategoriesService {
  /*
  * Provider service to get latest number of categories. Used to increment position of newly created category.
  * */
  int? numberOfCategories;

  void changeNumberOfCategories(int newCategories) {
    numberOfCategories = newCategories;
  }
}

class SubcategoryServices {
  Future<List<Subcategory>> getSubcategories(categoryId) async {
    // TODO: Change museum doc to variable and add organization as top level collection

    List<Subcategory> subcategories = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc(Constants.museumDocId)
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
    // TODO: Change museum doc to variable and add organization as top level collection
    List<Artefact> artefacts = [];
    CollectionReference categoriesReference = FirebaseFirestore.instance
        .collection("museum")
        .doc(Constants.museumDocId)
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
        .doc(Constants.museumDocId)
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
