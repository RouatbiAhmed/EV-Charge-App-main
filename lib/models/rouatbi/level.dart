class Level {
  String? comments;
  bool? isFastChargeCapable;
  int? id;
  String? title;

  Level({this.comments, this.isFastChargeCapable, this.id, this.title});

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        comments: json['Comments'] as String?,
        isFastChargeCapable: json['IsFastChargeCapable'] as bool?,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Comments': comments,
        'IsFastChargeCapable': isFastChargeCapable,
        'ID': id,
        'Title': title,
      };
}
