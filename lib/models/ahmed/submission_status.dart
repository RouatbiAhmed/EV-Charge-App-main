class SubmissionStatus {
  bool? isLive;
  int? id;
  String? title;

  SubmissionStatus({this.isLive, this.id, this.title});

  factory SubmissionStatus.fromJson(Map<String, dynamic> json) {
    return SubmissionStatus(
      isLive: json['IsLive'] as bool?,
      id: json['ID'] as int?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'IsLive': isLive,
        'ID': id,
        'Title': title,
      };
}
