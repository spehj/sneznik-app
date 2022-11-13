class Artefact {
  String artefactId;
  String artefactName;
  String artefactDescription;
  String artefactImageUrl;
  int artefactPosition;

  Artefact(
      {required this.artefactId,
      required this.artefactName,
      required this.artefactDescription,
      required this.artefactImageUrl,
      required this.artefactPosition});

  factory Artefact.fromJson(Map<String, dynamic> json){
    return Artefact(
      artefactId: json["artefactId"] as String,
      artefactName: json["artefactName"] as String,
      artefactDescription: json["artefactDescription"] as String,
      artefactImageUrl: json["artefactImageUrl"] as String,
      artefactPosition: json["artefactPosition"] as int
    );
  }
}
