import '../models/category_model.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      // Category(categoryName: "Castle Cellar", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", subcategories: []),
      // Category(categoryName: "First Floor", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", subcategories: []),
      // Category(categoryName: "Second Floor", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", subcategories: []),
      // Category(categoryName: "Third Floor", categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...", categoryImage: "Medved-Sneznik-0002.jpg", subcategories: []),
      Category(
        categoryId: "001",
          categoryName: "Category 1",
          categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
          categoryImage: "Medved-Sneznik-0002.jpg",
          categoryMap: "castle-floor-plan.jpg",
          //subcategories: [],
          categoryPosition: 0
      ),
      Category(
          categoryId: "002",
          categoryName: "Category 2",
          categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
          categoryImage: "Medved-Sneznik-0002.jpg",
          categoryMap: "castle-floor-plan.jpg",
          //subcategories: [],
          categoryPosition: 1
      ),
      Category(
          categoryId: "003",
          categoryName: "Category 3",
          categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
          categoryImage: "Medved-Sneznik-0002.jpg",
          categoryMap: "castle-floor-plan.jpg",
          // subcategories: [],
          categoryPosition: 2
      ),
      Category(
          categoryId: "004",
          categoryName: "Category 4",
          categoryDescription: "Meet the great brown bear, explore magnificent dining hall, experience the wedding room...",
          categoryImage: "Medved-Sneznik-0002.jpg",
          categoryMap: "castle-floor-plan.jpg",
          // subcategories: [],
          categoryPosition: 3
      ),

    ];
  }
}
