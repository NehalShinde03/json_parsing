class Data {
  List<Heading> heading;

  Data({
    required this.heading,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    heading: List<Heading>.from(json["heading"].map((x) => Heading.fromJson(x))),
  );

  /*Map<String, dynamic> toJson() => {
    "heading": List<dynamic>.from(heading.map((x) => x.toJson())),
  };*/
}

class Heading {
  String label;

  Heading({
    required this.label,
  });

  factory Heading.fromJson(Map<String, dynamic> json) => Heading(
    label: json["label"],
  );

  /*Map<String, dynamic> toJson() => {
    "label1": label1,
    "label1": label2,
  };*/
}
