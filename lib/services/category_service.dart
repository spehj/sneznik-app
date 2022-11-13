import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../utils/constants.dart';

class CategoryService{
  FirebaseFirestore? _instance;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<void> getAllCategories() async {

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
      _categories.add(Category.fromJson(element));
    }
    // return categories;
  }
}