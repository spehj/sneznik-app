import 'dart:io';

import 'artefact_model.dart';

class Subcategory {
  String categoryName;
  String subcategoryName;
  String subcategoryDescription;
  String subcategoryImage;

  List<Artefact> artefacts;

  Subcategory(
      {required this.categoryName,
      required this.subcategoryName,
      required this.subcategoryDescription,
      required this.subcategoryImage,
      required this.artefacts});

  static List<Subcategory>? fetchSubcategories(category) {
    List<Subcategory>? subcategories = [];
    int allSubsLength = allSubcategories.length;
    //int counter = 0;
    for (var i = 0; i < allSubsLength; i++) {

      if (allSubcategories[i].categoryName == category) {
        //print("In this category: ${allSubcategories[i].subcategoryName}");
        subcategories?.add(allSubcategories[i]);

      }
    }
    print("------------------------------");
    return subcategories;
  }
}

List<Subcategory> allSubcategories = [
  Subcategory(
      categoryName: "Castle Cellar 1",
      subcategoryName: "Room 1",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 2",
      subcategoryName: "Room 2",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 3",
      subcategoryName: "Room 3",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 4",
      subcategoryName: "Room 4",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 1",
      subcategoryName: "Room 2",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 1",
      subcategoryName: "Room 3",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 1",
      subcategoryName: "Room 4",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 2",
      subcategoryName: "Room 3",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 3",
      subcategoryName: "Room 4",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 3",
      subcategoryName: "Room 5",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 4",
      subcategoryName: "Room 6",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 2",
      subcategoryName: "Room 7",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 2",
      subcategoryName: "Room 8",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
  Subcategory(
      categoryName: "Castle Cellar 2",
      subcategoryName: "Room 9",
      subcategoryDescription: "subcategoryDescription",
      subcategoryImage: "Medved-Sneznik-0002.jpg",
      artefacts: []),
];
