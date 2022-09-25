import '../models/category_model.dart';

class Utils{
  static List<Category> getMockedCategories(){
    return [
      Category(categoryName: "Castle Cellar", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg"),
      Category(categoryName: "First Floor", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg"),
      Category(categoryName: "Second Floor", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg"),
      Category(categoryName: "Third Floor", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg"),

    ];
  }
}