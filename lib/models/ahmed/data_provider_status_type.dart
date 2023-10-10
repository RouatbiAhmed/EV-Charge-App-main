class DataProviderStatusType {
  bool? isProviderEnabled;
  int? id;
  String? title;

  DataProviderStatusType({this.isProviderEnabled, this.id, this.title});

  factory DataProviderStatusType.fromJson(Map<String, dynamic> json) {
    return DataProviderStatusType(
      isProviderEnabled: json['IsProviderEnabled'] as bool?,
      id: json['ID'] as int?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'IsProviderEnabled': isProviderEnabled,
        'ID': id,
        'Title': title,
      };
}
