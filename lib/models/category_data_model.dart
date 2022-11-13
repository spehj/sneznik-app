import 'dart:ffi';

import 'package:sneznik_app/models/artefact_model.dart';

class CategoryModel {
  String categoryId;
  String categoryName;
  String categoryDescription;
  String categoryImageUrl;
  String categoryMapUrl;
  Int categoryPosition;
  List<Subcategories>? subcategories;

  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryDescription,
      required this.categoryImageUrl,
      required this.categoryMapUrl,
      required this.categoryPosition,
      required this.subcategories});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : categoryId = json["id"] as String,
        categoryName = json["name"] as String,
        categoryDescription = json["description"] as String,
        categoryImageUrl = json["imageUrl"] as String,
        categoryMapUrl = json["categoryMapUrl"] as String,
        categoryPosition = json["position"] as Int,

        // TODO: edit Subcategory to subcategories in Firebase
        subcategories = (json["Subcategory"] as List)
            .map((dynamic e) =>
                Subcategories.fromJson(e as Map<String, dynamic>))
            .toList();
}

class Subcategories {
  String subcategoryId;
  String subcategoryName;
  String subcategoryDescription;
  String subcategoryImageUrl;
  List<Artefacts>? artefacts;

  Subcategories(
      {required this.subcategoryId,
      required this.subcategoryName,
      required this.subcategoryDescription,
      required this.subcategoryImageUrl,
      required this.artefacts});


  Subcategories.fromJson(Map<String, dynamic> json)
      : subcategoryId = json["id"] as String,
        subcategoryName = json["name"] as String,
        subcategoryDescription = json["description"] as String,
        subcategoryImageUrl = json["imageUrl"] as String,

        artefacts = (json["artefacts"] as List)
            .map((dynamic e) =>
            Artefacts.fromJson(e as Map<String, dynamic>))
            .toList();
}

class Artefacts {
  String artefactId;
  String artefactName;
  String artefactDescription;
  String artefactImageUrl;

  Artefacts(
      {required this.artefactId,
      required this.artefactName,
      required this.artefactDescription,
      required this.artefactImageUrl});

  Artefacts.fromJson(Map<String, dynamic> json)
      : artefactId = json["id"] as String,
        artefactName = json["name"] as String,
        artefactDescription = json["description"] as String,
        artefactImageUrl = json["imageUrl"] as String;

}
