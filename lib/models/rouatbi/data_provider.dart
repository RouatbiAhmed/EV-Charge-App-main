import 'data_provider_status_type.dart';

class DataProvider {
  String? websiteUrl;
  dynamic comments;
  DataProviderStatusType? dataProviderStatusType;
  bool? isRestrictedEdit;
  bool? isOpenDataLicensed;
  bool? isApprovedImport;
  String? license;
  dynamic dateLastImported;
  int? id;
  String? title;

  DataProvider({
    this.websiteUrl,
    this.comments,
    this.dataProviderStatusType,
    this.isRestrictedEdit,
    this.isOpenDataLicensed,
    this.isApprovedImport,
    this.license,
    this.dateLastImported,
    this.id,
    this.title,
  });

  factory DataProvider.fromJson(Map<String, dynamic> json) => DataProvider(
        websiteUrl: json['WebsiteURL'] as String?,
        comments: json['Comments'] as dynamic,
        dataProviderStatusType: json['DataProviderStatusType'] == null
            ? null
            : DataProviderStatusType.fromJson(
                json['DataProviderStatusType'] as Map<String, dynamic>),
        isRestrictedEdit: json['IsRestrictedEdit'] as bool?,
        isOpenDataLicensed: json['IsOpenDataLicensed'] as bool?,
        isApprovedImport: json['IsApprovedImport'] as bool?,
        license: json['License'] as String?,
        dateLastImported: json['DateLastImported'] as dynamic,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'WebsiteURL': websiteUrl,
        'Comments': comments,
        'DataProviderStatusType': dataProviderStatusType?.toJson(),
        'IsRestrictedEdit': isRestrictedEdit,
        'IsOpenDataLicensed': isOpenDataLicensed,
        'IsApprovedImport': isApprovedImport,
        'License': license,
        'DateLastImported': dateLastImported,
        'ID': id,
        'Title': title,
      };
}
