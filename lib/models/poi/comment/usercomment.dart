import 'package:evchstation/models/poi/comment/checkinstatustype.dart';
import 'package:evchstation/models/user/user.dart';



class UserComment {
  int? id;
  int? chargePointId;
  String? userName;
  String? comment;
  int? rating;
  DateTime? dateCreated;
  User? user;
  CheckinStatusType? checkinStatusType;

  UserComment({
    this.id,
    this.chargePointId,
    this.userName,
    this.comment,
    this.rating,
    this.dateCreated,
    this.user,
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
        user: json['User'] == null
            ? null
            : User.fromJson(json['User'] as Map<String, dynamic>),
        checkinStatusType: json['CheckinStatusType'] == null
            ? null
            : CheckinStatusType.fromJson(
                json['CheckinStatusType'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'ChargePointID': chargePointId,
        'UserName': userName,
        'Comment': comment,
        'Rating': rating,
        'DateCreated': dateCreated?.toIso8601String(),
        'User': user?.toJson(),
        'CheckinStatusType': checkinStatusType?.toJson(),
      };
}
