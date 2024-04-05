class RawMaterial {
  int? materialID;
  String? materialName;
  String? materialType;

  RawMaterial({this.materialID, this.materialName, this.materialType});

  factory RawMaterial.fromJson(Map<String, dynamic> json) {
    return RawMaterial(
      materialID: json['materialID'],
      materialName: json['materialName'],
      materialType: json['materialType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'materialID': materialID,
      'materialName': materialName,
      'materialType': materialType,
    };
  }
}