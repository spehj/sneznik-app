import 'artefact_model.dart';
import 'category_model.dart';

class Subcategory {
  String subcategoryId;
  String subcategoryName;
  String subcategoryDescription;
  String subcategoryImageUrl;
  int subcategoryPosition;

  //List<Artefact> artefacts;

  Subcategory(
      {required this.subcategoryId,
      required this.subcategoryName,
      required this.subcategoryDescription,
      required this.subcategoryImageUrl,
      required this.subcategoryPosition});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
        subcategoryId: json["subcategoryId"] as String,
        subcategoryName: json["subcategoryName"] as String,
        subcategoryDescription: json["subcategoryDescription"] as String,
        subcategoryImageUrl: json["subcategoryImageUrl"] as String,
        subcategoryPosition: json["subcategoryPosition"] as int);
  }
}
