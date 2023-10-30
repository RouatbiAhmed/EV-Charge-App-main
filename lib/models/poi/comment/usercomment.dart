import 'package:evchstation/models/poi/comment/checkinstatustype.dart';


class UserComment {
  int? id;
  int? chargePointId;
  String? userName;
  String? comment;
  int? rating;
  DateTime? dateCreated;
  CheckinStatusType? checkinStatusType;

  UserComment({
    this.id,
    this.chargePointId,
    this.userName,
    this.comment,
    this.rating,
    this.dateCreated,
    this.checkinStatusType,
  });

  factory UserComment.fromJson(Map<String, dynamic> json) => UserComment(
        id: json['ID'] as int?,
        chargePointId: json['ChargePointID'] as int?,
        userName: json['UserName'] as String?,
        comment: json['Comment'] as String?,
        rating: json['Rating'] as int?,
        dateCreated: json['DateCreated'] == null
            ? null
            : DateTime.parse(json['DateCreated'] as String),
        checkinStatusType: json['CheckinStatusType'] == null? null: CheckinStatusType.fromJson(json['CheckinStatusType'] as Map<String, dynamic>),
      );


}
