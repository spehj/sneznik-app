import 'package:sneznik_app/models/artefact_model.dart';

import 'subcategory_model.dart';


class Category {
  String categoryId;
  String categoryName;
  String categoryImage;
  String categoryDescription;
  String categoryMap;
  int categoryPosition;
  List<Subcategory> subcategories;

  Category(

      {required this.categoryId,
        required this.categoryName,
      required this.categoryDescription,
      required this.categoryImage,
      required this.categoryMap,
      required this.subcategories,
      required this.categoryPosition});

  factory Category.fromJson(Map<String, dynamic> json) {
    //print(json);
    json.forEach((key, value) {
      if (value == null){
        print("${json[key]} ${json["categoryName"]}");
      }
    });
    return Category(
      categoryId: json["categoryId"] as String,
        categoryName: json["categoryName"] as String,
        categoryDescription: json["categoryDescription"] as String,
        categoryImage: json["categoryImageUrl"] as String,
        categoryMap: json["categoryMapUrl"] as String,
        categoryPosition: json["categoryPosition"] as int,
        subcategories: []);

  }

  static List<Category> fetchAll() {
    return [];
    // return [
    //   Category(
    //       categoryName: "Castle Cellar 1",
    //       categoryDescription:
    //           "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
    //       categoryImage: "Medved-Sneznik-0002.jpg",
    //       categoryMap: "castle-floor.jpg",
    //       subcategories: []),
    //   Category(
    //       categoryName: "Castle Cellar 2",
    //       categoryDescription:
    //           "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
    //       categoryImage: "Medved-Sneznik-0002.jpg",
    //       categoryMap: "castle-floor.jpg",
    //       subcategories: []),
    //   Category(
    //       categoryName: "Castle Cellar 3",
    //       categoryDescription:
    //           "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
    //       categoryImage: "Medved-Sneznik-0002.jpg",
    //       categoryMap: "castle-floor.jpg",
    //       subcategories: []),
    //   Category(
    //       categoryName: "Castle Cellar 4",
    //       categoryDescription:
    //           "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
    //       categoryImage: "Medved-Sneznik-0002.jpg",
    //       categoryMap: "castle-floor.jpg",
    //       subcategories: []),
    //   // Category(categoryName: "Castle Cellar 2", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg",categoryMap:"castle-floor.jpg" , subcategories: [Subcategory(subcategoryName: "subcategoryName", subcategoryDescription: "subcategoryDescription", subcategoryImage: "Medved-Sneznik-0002.jpg", artefacts: [Artefact(artefactName: "artefactName", artefactDescription: "artefactDescription", artefactImage: "Medved-Sneznik-0002.jpg")])]),
    //   // Category(categoryName: "Castle Cellar 3", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg",categoryMap:"castle-floor.jpg" , subcategories: [Subcategory(subcategoryName: "subcategoryName", subcategoryDescription: "subcategoryDescription", subcategoryImage: "Medved-Sneznik-0002.jpg", artefacts: [Artefact(artefactName: "artefactName", artefactDescription: "artefactDescription", artefactImage: "Medved-Sneznik-0002.jpg")])]),
    //   // //Category(categoryName: "Castle Cellar 3", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg",categoryMap:"castle-floor.jpg" , subcategories: [Subcategory(subcategoryName: "subcategoryName", subcategoryDescription: "subcategoryDescription", subcategoryImage: "Medved-Sneznik-0002.jpg", artefacts: [Artefact(artefactName: "artefactName", artefactDescription: "artefactDescription", artefactImage: "Medved-Sneznik-0002.jpg")])]),
    // ];
  }
}
