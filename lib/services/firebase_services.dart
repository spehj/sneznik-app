

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/subcategory_model.dart';

class SubcategoryServices{
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
    allSubcategories.forEach((element) {
      subcategories.add(Subcategory.fromJson(element));
    });
    return subcategories;
  }
}