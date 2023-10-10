class CheckinStatusType {
  bool? isPositive;
  bool? isAutomatedCheckin;
  int? id;
  String? title;

  CheckinStatusType({
    this.isPositive,
    this.isAutomatedCheckin,
    this.id,
    this.title,
  });

  factory CheckinStatusType.fromJson(Map<String, dynamic> json) {
    return CheckinStatusType(
      isPositive: json['IsPositive'] as bool?,
      isAutomatedCheckin: json['IsAutomatedCheckin'] as bool?,
      id: json['ID'] as int?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'IsPositive': isPositive,
        'IsAutomatedCheckin': isAutomatedCheckin,
        'ID': id,
        'Title': title,
      };
}
