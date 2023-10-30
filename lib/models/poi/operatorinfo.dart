class OperatorInfo {

  final String title;
  final String? websiteUrl;

  OperatorInfo({required this.title, required this.websiteUrl});

  factory OperatorInfo.fromJson(Map<String, dynamic> json) {
    return OperatorInfo(
      title: json['Title'],
      websiteUrl: json['WebsiteURL'] as String?,
    );
  }
}