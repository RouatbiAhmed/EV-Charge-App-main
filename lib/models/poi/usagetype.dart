class UsageType {
  dynamic isPayAtLocation;
  dynamic isMembershipRequired;
  dynamic isAccessKeyRequired;
  int? id;
  String? title;

  UsageType({
    this.isPayAtLocation,
    this.isMembershipRequired,
    this.isAccessKeyRequired,
    this.id,
    this.title,
  });

  factory UsageType.fromJson(Map<String, dynamic> json) => UsageType(
        isPayAtLocation: json['IsPayAtLocation'] as dynamic,
        isMembershipRequired: json['IsMembershipRequired'] as dynamic,
        isAccessKeyRequired: json['IsAccessKeyRequired'] as dynamic,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );
}
