import 'package:evchstation/models/poi/country.dart';

class AddressInfo {
  final double latitude;
  final double longitude;
  final String title;
  final String? addressLine1;
  final String? town;
  final String? stateOrProvince;
  final String? postcode;
  final Country? country;

  AddressInfo({
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.addressLine1,
    required this.town,
    required this.stateOrProvince,
    required this.postcode,
    required this.country,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) {
    return AddressInfo(
      latitude: json['Latitude'],
      longitude: json['Longitude'],
      title: json['Title'],
      addressLine1: json['AddressLine1'] as String?,
      town: json['Town'] as String?,
      stateOrProvince: json['StateOrProvince'] as String?,
      postcode: json['Postcode'] as String?,
      country: json['Country'] == null
          ? null
          : Country.fromJson(json['Country'] as Map<String, dynamic>),
    );
  }
}