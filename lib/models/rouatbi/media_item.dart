import 'user.dart';

class MediaItem {
  int? id;
  int? chargePointId;
  String? itemUrl;
  String? itemThumbnailUrl;
  String? comment;
  bool? isEnabled;
  bool? isVideo;
  bool? isFeaturedItem;
  bool? isExternalResource;
  dynamic metadataValue;
  User? user;
  String? dateCreated;

  MediaItem({
    this.id,
    this.chargePointId,
    this.itemUrl,
    this.itemThumbnailUrl,
    this.comment,
    this.isEnabled,
    this.isVideo,
    this.isFeaturedItem,
    this.isExternalResource,
    this.metadataValue,
    this.user,
    this.dateCreated,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
        id: json['ID'] as int?,
        chargePointId: json['ChargePointID'] as int?,
        itemUrl: json['ItemURL'] as String?,
        itemThumbnailUrl: json['ItemThumbnailURL'] as String?,
        comment: json['Comment'] as String?,
        isEnabled: json['IsEnabled'] as bool?,
        isVideo: json['IsVideo'] as bool?,
        isFeaturedItem: json['IsFeaturedItem'] as bool?,
        isExternalResource: json['IsExternalResource'] as bool?,
        metadataValue: json['MetadataValue'] as dynamic,
        user: json['User'] == null
            ? null
            : User.fromJson(json['User'] as Map<String, dynamic>),
        dateCreated: json['DateCreated'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'ChargePointID': chargePointId,
        'ItemURL': itemUrl,
        'ItemThumbnailURL': itemThumbnailUrl,
        'Comment': comment,
        'IsEnabled': isEnabled,
        'IsVideo': isVideo,
        'IsFeaturedItem': isFeaturedItem,
        'IsExternalResource': isExternalResource,
        'MetadataValue': metadataValue,
        'User': user?.toJson(),
        'DateCreated': dateCreated,
      };
}
