import 'package:evchstation/models/ahmed/usage_type.dart';
import 'package:evchstation/models/poi/comment/usercomment.dart';
import 'package:evchstation/models/poi/country.dart';
import 'package:evchstation/models/poi/statustype.dart';

class Poi {
  final int id;
  final AddressInfo addressInfo;
  final OperatorInfo operatorinfo;
  final String UsageCost;

  //List<Connection>? connections;
  final StatusType? statusType;
  final UsageType? usageType;
  final int? numberOfPoints;

  // final String ?CurrentType;
  List<UserComment>? usercomment;

  final List? Connec;
  final List<dynamic>? Media;
  //__________________

  Poi({
    required this.id,
    required this.addressInfo,
    required this.operatorinfo,
    required this.UsageCost,
    // List<Connection>? connections,//a enlever avec amps,voltage et powerkw
    required this.statusType,
    required this.usageType,
    // required this.connectiontitle,
    required this.numberOfPoints,

    required this.usercomment,
    required this.Connec,
    required this.Media,
  });

  factory Poi.fromJson(Map<String, dynamic> json) {


    //final connec=json['Connections'];
    final media = json['MediaItems'];
    //  final operinfo=json['OperatorInfo'];

    return Poi(
      UsageCost: json['UsageCost']??"Unknown",
      id: json['ID'],
      addressInfo:AddressInfo.fromJson(json['AddressInfo'] as Map<String, dynamic>),
      operatorinfo: json['OperatorInfo'] != null
          ? OperatorInfo.fromJson(json['OperatorInfo'] as Map<String, dynamic>)
          : OperatorInfo(title: "Unknown", websiteUrl: "Unknown"),
      //connections: (json['Connections'] as List<dynamic>?)?.map((e) => Connection.fromJson(e as Map<String, dynamic>)).toList(),
      statusType: json['StatusType'] == null
          ? null
          : StatusType.fromJson(json['StatusType'] as Map<String, dynamic>),
      usageType: json['UsageType'] == null
          ? null
          : UsageType.fromJson(json['UsageType'] as Map<String, dynamic>),
      // connectiontitle: connectionTypeTitle,
      numberOfPoints: json['NumberOfPoints'] as int?,

     // UserComment: usercomment ?? ["NO comments"],
       // usercomment:json['UserComments'],
       usercomment:(json['UserComments'] as List<dynamic>?)?.map((e) => UserComment.fromJson(e as Map<String, dynamic>)).toList(),
       
     // (json['UserComments'] as List<dynamic>?)?.map((e) => UserComment.fromJson(e as Map<String, dynamic>)).toList(),

      Connec: json['Connections'],
      Media: media,
      // OperInfo: operinfo
    );
  }
}

//********************************** */

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

//___________________________________
class OperatorInfo {
  //final double latitude;
  //final double longitude;
  final String title;
  String? websiteUrl;

  OperatorInfo({required this.title, required this.websiteUrl});

  factory OperatorInfo.fromJson(Map<String, dynamic> json) {
    return OperatorInfo(
      title: json['Title'],
      websiteUrl: json['WebsiteURL'] as String?,
    );
  }
}