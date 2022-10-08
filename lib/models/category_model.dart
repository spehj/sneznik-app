import 'package:sneznik_app/models/artefact_model.dart';

import 'subcategory_model.dart';

class Category {
  late String categoryName;
  late String categoryImage;
  late String categoryDescription;
  late String categoryMap;

  late int position;

  List<Subcategory> subcategories;
  Category({required this.categoryName, required this.categoryDescription, required this.categoryImage, required this.categoryMap, required this.subcategories});


  
  static List<Category> fetchAll(){
    return [
      Category(categoryName: "Castle Cellar 1", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", categoryMap:"castle-floor.jpg" , subcategories: []),
      Category(categoryName: "Castle Cellar 2", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", categoryMap:"castle-floor.jpg" , subcategories: []),
      Category(categoryName: "Castle Cellar 3", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", categoryMap:"castle-floor.jpg" , subcategories: []),
      Category(categoryName: "Castle Cellar 4", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", categoryMap:"castle-floor.jpg" , subcategories: []),
      // Category(categoryName: "Castle Cellar 2", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg",categoryMap:"castle-floor.jpg" , subcategories: [Subcategory(subcategoryName: "subcategoryName", subcategoryDescription: "subcategoryDescription", subcategoryImage: "Medved-Sneznik-0002.jpg", artefacts: [Artefact(artefactName: "artefactName", artefactDescription: "artefactDescription", artefactImage: "Medved-Sneznik-0002.jpg")])]),
      // Category(categoryName: "Castle Cellar 3", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg",categoryMap:"castle-floor.jpg" , subcategories: [Subcategory(subcategoryName: "subcategoryName", subcategoryDescription: "subcategoryDescription", subcategoryImage: "Medved-Sneznik-0002.jpg", artefacts: [Artefact(artefactName: "artefactName", artefactDescription: "artefactDescription", artefactImage: "Medved-Sneznik-0002.jpg")])]),
      // //Category(categoryName: "Castle Cellar 3", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg",categoryMap:"castle-floor.jpg" , subcategories: [Subcategory(subcategoryName: "subcategoryName", subcategoryDescription: "subcategoryDescription", subcategoryImage: "Medved-Sneznik-0002.jpg", artefacts: [Artefact(artefactName: "artefactName", artefactDescription: "artefactDescription", artefactImage: "Medved-Sneznik-0002.jpg")])]),

    ];
  }

}
