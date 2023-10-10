import 'checkin_status_type.dart';
import 'comment_type.dart';
import 'user.dart';

class UserComment {
  int? id;
  int? chargePointId;
  int? commentTypeId;
  CommentType? commentType;
  String? userName;
  String? comment;
  int? rating;
  String? relatedUrl;
  DateTime? dateCreated;
  User? user;
  int? checkinStatusTypeId;
  CheckinStatusType? checkinStatusType;
  bool? isActionedByEditor;

  UserComment({
    this.id,
    this.chargePointId,
    this.commentTypeId,
    this.commentType,
    this.userName,
    this.comment,
    this.rating,
    this.relatedUrl,
    this.dateCreated,
    this.user,
    this.checkinStatusTypeId,
    this.checkinStatusType,
    this.isActionedByEditor,
  });

  factory UserComment.fromJson(Map<String, dynamic> json) => UserComment(
        id: json['ID'] as int?,
        chargePointId: json['ChargePointID'] as int?,
        commentTypeId: json['CommentTypeID'] as int?,
        commentType: json['CommentType'] == null
            ? null
            : CommentType.fromJson(json['CommentType'] as Map<String, dynamic>),
        userName: json['UserName'] as String?,
        comment: json['Comment'] as String?,
        rating: json['Rating'] as int?,
        relatedUrl: json['RelatedURL'] as String?,
        dateCreated: json['DateCreated'] == null
            ? null
            : DateTime.parse(json['DateCreated'] as String),
        user: json['User'] == null
            ? null
            : User.fromJson(json['User'] as Map<String, dynamic>),
        checkinStatusTypeId: json['CheckinStatusTypeID'] as int?,
        checkinStatusType: json['CheckinStatusType'] == null
            ? null
            : CheckinStatusType.fromJson(
                json['CheckinStatusType'] as Map<String, dynamic>),
        isActionedByEditor: json['IsActionedByEditor'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'ChargePointID': chargePointId,
        'CommentTypeID': commentTypeId,
        'CommentType': commentType?.toJson(),
        'UserName': userName,
        'Comment': comment,
        'Rating': rating,
        'RelatedURL': relatedUrl,
        'DateCreated': dateCreated?.toIso8601String(),
        'User': user?.toJson(),
        'CheckinStatusTypeID': checkinStatusTypeId,
        'CheckinStatusType': checkinStatusType?.toJson(),
        'IsActionedByEditor': isActionedByEditor,
      };
}
