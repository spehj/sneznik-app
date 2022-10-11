import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';

class CategoryService{
  FirebaseFirestore? _instance;
  List<Category> _categories = [];

  List<Category> getCategories(){
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async{
    // FirebaseApp app = await Firebase.initializeApp();
    _instance = FirebaseFirestore.instance;
    CollectionReference _collectionRef = _instance!.collection("categories");
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final allData = querySnapshot.docs.map((doc) => {doc.id : doc.data()}).toList();
    //DocumentSnapshot snapshot = await categories.doc("UsAyEEOmsUMMRqAWZc93").get();
    //var data = snapshot.data();
    log("Dataaa: ${allData}");
    allData.forEach((element) {
      log("Test: ${element.values.runtimeType}");
    });
    log("-------------------------------------");
  }
}