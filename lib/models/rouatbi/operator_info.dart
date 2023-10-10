class OperatorInfo {
  String? websiteUrl;
  dynamic comments;
  dynamic phonePrimaryContact;
  dynamic phoneSecondaryContact;
  bool? isPrivateIndividual;
  dynamic addressInfo;
  dynamic bookingUrl;
  dynamic contactEmail;
  dynamic faultReportEmail;
  bool? isRestrictedEdit;
  int? id;
  String? title;

  OperatorInfo({
    this.websiteUrl,
    this.comments,
    this.phonePrimaryContact,
    this.phoneSecondaryContact,
    this.isPrivateIndividual,
    this.addressInfo,
    this.bookingUrl,
    this.contactEmail,
    this.faultReportEmail,
    this.isRestrictedEdit,
    this.id,
    this.title,
  });

  factory OperatorInfo.fromJson(Map<String, dynamic> json) => OperatorInfo(
        websiteUrl: json['WebsiteURL'] as String?,
        comments: json['Comments'] as dynamic,
        phonePrimaryContact: json['PhonePrimaryContact'] as dynamic,
        phoneSecondaryContact: json['PhoneSecondaryContact'] as dynamic,
        isPrivateIndividual: json['IsPrivateIndividual'] as bool?,
        addressInfo: json['AddressInfo'] as dynamic,
        bookingUrl: json['BookingURL'] as dynamic,
        contactEmail: json['ContactEmail'] as dynamic,
        faultReportEmail: json['FaultReportEmail'] as dynamic,
        isRestrictedEdit: json['IsRestrictedEdit'] as bool?,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'WebsiteURL': websiteUrl,
        'Comments': comments,
        'PhonePrimaryContact': phonePrimaryContact,
        'PhoneSecondaryContact': phoneSecondaryContact,
        'IsPrivateIndividual': isPrivateIndividual,
        'AddressInfo': addressInfo,
        'BookingURL': bookingUrl,
        'ContactEmail': contactEmail,
        'FaultReportEmail': faultReportEmail,
        'IsRestrictedEdit': isRestrictedEdit,
        'ID': id,
        'Title': title,
      };
}
