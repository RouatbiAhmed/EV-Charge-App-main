class CurrentType {
  String? description;
  int? id;
  String? title;

  CurrentType({this.description, this.id, this.title});

  factory CurrentType.fromJson(Map<String, dynamic> json) => CurrentType(
        description: json['Description'] as String?,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Description': description,
        'ID': id,
        'Title': title,
      };
}
