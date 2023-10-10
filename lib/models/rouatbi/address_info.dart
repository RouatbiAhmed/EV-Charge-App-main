import 'country.dart';

class AddressInfo {
  int? id;
  String? title;
  String? addressLine1;
  dynamic addressLine2;
  String? town;
  String? stateOrProvince;
  String? postcode;
  int? countryId;
  Country? country;
  double? latitude;
  double? longitude;
  dynamic contactTelephone1;
  dynamic contactTelephone2;
  dynamic contactEmail;
  dynamic accessComments;
  dynamic relatedUrl;
  dynamic distance;
  int? distanceUnit;

  AddressInfo({
    this.id,
    this.title,
    this.addressLine1,
    this.addressLine2,
    this.town,
    this.stateOrProvince,
    this.postcode,
    this.countryId,
    this.country,
    this.latitude,
    this.longitude,
    this.contactTelephone1,
    this.contactTelephone2,
    this.contactEmail,
    this.accessComments,
    this.relatedUrl,
    this.distance,
    this.distanceUnit,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) => AddressInfo(
        id: json['ID'] as int?,
        title: json['Title'] as String?,
        addressLine1: json['AddressLine1'] as String?,
        addressLine2: json['AddressLine2'] as dynamic,
        town: json['Town'] as String?,
        stateOrProvince: json['StateOrProvince'] as String?,
        postcode: json['Postcode'] as String?,
        countryId: json['CountryID'] as int?,
        country: json['Country'] == null
            ? null
            : Country.fromJson(json['Country'] as Map<String, dynamic>),
        latitude: (json['Latitude'] as num?)?.toDouble(),
        longitude: (json['Longitude'] as num?)?.toDouble(),
        contactTelephone1: json['ContactTelephone1'] as dynamic,
        contactTelephone2: json['ContactTelephone2'] as dynamic,
        contactEmail: json['ContactEmail'] as dynamic,
        accessComments: json['AccessComments'] as dynamic,
        relatedUrl: json['RelatedURL'] as dynamic,
        distance: json['Distance'] as dynamic,
        distanceUnit: json['DistanceUnit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Title': title,
        'AddressLine1': addressLine1,
        'AddressLine2': addressLine2,
        'Town': town,
        'StateOrProvince': stateOrProvince,
        'Postcode': postcode,
        'CountryID': countryId,
        'Country': country?.toJson(),
        'Latitude': latitude,
        'Longitude': longitude,
        'ContactTelephone1': contactTelephone1,
        'ContactTelephone2': contactTelephone2,
        'ContactEmail': contactEmail,
        'AccessComments': accessComments,
        'RelatedURL': relatedUrl,
        'Distance': distance,
        'DistanceUnit': distanceUnit,
      };
}
