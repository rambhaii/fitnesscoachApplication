class SetLists {
  int? id;
  String? repsNo;
  String? weight;

  SetLists({
    this.id,
    this.repsNo,
    this.weight,
  });

  factory SetLists.fromJson(Map<String, dynamic> json) => SetLists(
        id: json["id"],
        repsNo: json["repsNo"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "repsNo": repsNo,
        "weight": weight,
      };
}
