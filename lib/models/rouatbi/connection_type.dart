class ConnectionType {
  String? formalName;
  bool? isDiscontinued;
  bool? isObsolete;
  int? id;
  String? title;

  ConnectionType({
    this.formalName,
    this.isDiscontinued,
    this.isObsolete,
    this.id,
    this.title,
  });

  factory ConnectionType.fromJson(Map<String, dynamic> json) {
    return ConnectionType(
      formalName: json['FormalName'] as String?,
      isDiscontinued: json['IsDiscontinued'] as bool?,
      isObsolete: json['IsObsolete'] as bool?,
      id: json['ID'] as int?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'FormalName': formalName,
        'IsDiscontinued': isDiscontinued,
        'IsObsolete': isObsolete,
        'ID': id,
        'Title': title,
      };
}
