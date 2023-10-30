class StatusType {
  bool? isOperational;
  bool? isUserSelectable;
  int? id;
  String? title;

  StatusType({
    this.isOperational,
    this.isUserSelectable,
    this.id,
    this.title,
  });

  factory StatusType.fromJson(Map<String, dynamic> json) => StatusType(
        isOperational: json['IsOperational'] as bool?,
        isUserSelectable: json['IsUserSelectable'] as bool?,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );

}
