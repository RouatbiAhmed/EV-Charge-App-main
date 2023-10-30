import 'package:evchstation/models/poi/adressinfo.dart';
import 'package:evchstation/models/poi/comment/usercomment.dart';
import 'package:evchstation/models/poi/operatorinfo.dart';
import 'package:evchstation/models/poi/statustype.dart';
import 'package:evchstation/models/poi/usagetype.dart';

class Poi {
  final int id;
  final AddressInfo? addressInfo;
  final OperatorInfo? operatorinfo;
  final String? UsageCost;
  final StatusType? statusType;
  final UsageType? usageType;
  final int? numberOfPoints;
  List<UserComment>? usercomment;
  final List? Connec;
  final List<dynamic>? Media;

  Poi({
    required this.id,
    required this.addressInfo,
    required this.operatorinfo,
    required this.UsageCost,
    required this.statusType,
    required this.usageType,
    required this.numberOfPoints,
    required this.usercomment,
    required this.Connec,
    required this.Media,
  });

  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(
      UsageCost: json['UsageCost'] ?? "Unknown",
      id: json['ID'],
      addressInfo:
          AddressInfo.fromJson(json['AddressInfo'] as Map<String, dynamic>),
      operatorinfo: json['OperatorInfo'] != null
          ? OperatorInfo.fromJson(json['OperatorInfo'] as Map<String, dynamic>)
          : OperatorInfo(title: "Unknown", websiteUrl: "Unknown"),
      statusType: json['StatusType'] == null
          ? null
          : StatusType.fromJson(json['StatusType'] as Map<String, dynamic>),
      usageType: json['UsageType'] == null
          ? null
          : UsageType.fromJson(json['UsageType'] as Map<String, dynamic>),
      numberOfPoints: json['NumberOfPoints'] as int?,
      usercomment: (json['UserComments'] as List<dynamic>?)
          ?.map((e) => UserComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      Connec: json['Connections'],
      Media: (json['MediaItems'] as List<dynamic>?),
    );
  }
}


