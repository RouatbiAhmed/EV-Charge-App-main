class CheckinStatusType {
  bool? isPositive;

  CheckinStatusType({
    this.isPositive,
  });

  factory CheckinStatusType.fromJson(Map<String, dynamic> json) {
    return CheckinStatusType(
      isPositive: json['IsPositive'] as bool?,
    );
  }
}
