class CommentType {
  int? id;
  String? title;

  CommentType({this.id, this.title});

  factory CommentType.fromJson(Map<String, dynamic> json) => CommentType(
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Title': title,
      };
}
