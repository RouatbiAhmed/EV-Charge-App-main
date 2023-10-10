import 'address_info.dart';
import 'connection.dart';
import 'data_provider.dart';
import 'operator_info.dart';
import 'status_type.dart';
import 'submission_status.dart';
import 'usage_type.dart';

class Ahmed {
  DataProvider? dataProvider;
  OperatorInfo operatorInfo;
  UsageType? usageType;
  StatusType? statusType;
  SubmissionStatus? submissionStatus;
  dynamic userComments;
  dynamic percentageSimilarity;
  dynamic mediaItems;
  bool? isRecentlyVerified;
  String? dateLastVerified;
  int id;
  String? uuid;
  dynamic parentChargePointId;
  int? dataProviderId;
  dynamic dataProvidersReference;
  int? operatorId;
  dynamic operatorsReference;
  int? usageTypeId;
  dynamic usageCost;
  AddressInfo addressInfo;
  List<Connection>? connections;
  int? numberOfPoints;
  dynamic generalComments;
  dynamic datePlanned;
  dynamic dateLastConfirmed;
  int? statusTypeId;
  String? dateLastStatusUpdate;
  dynamic metadataValues;
  int? dataQualityLevel;
  String? dateCreated;
  int? submissionStatusTypeId;

  Ahmed({
    this.dataProvider,
    required this.operatorInfo,
    this.usageType,
    this.statusType,
    this.submissionStatus,
    this.userComments,
    this.percentageSimilarity,
    this.mediaItems,
    this.isRecentlyVerified,
    this.dateLastVerified,
    required this.id,
    this.uuid,
    this.parentChargePointId,
    this.dataProviderId,
    this.dataProvidersReference,
    this.operatorId,
    this.operatorsReference,
    this.usageTypeId,
    this.usageCost,
    required this.addressInfo,
    this.connections,
    this.numberOfPoints,
    this.generalComments,
    this.datePlanned,
    this.dateLastConfirmed,
    this.statusTypeId,
    this.dateLastStatusUpdate,
    this.metadataValues,
    this.dataQualityLevel,
    this.dateCreated,
    this.submissionStatusTypeId,
  });

  factory Ahmed.fromJson(Map<String, dynamic> json) => Ahmed(
        dataProvider: json['DataProvider'] == null
            ? null
            : DataProvider.fromJson(
                json['DataProvider'] as Map<String, dynamic>),
        operatorInfo:
            OperatorInfo.fromJson(json['OperatorInfo'] as Map<String, dynamic>),
        usageType: json['UsageType'] == null
            ? null
            : UsageType.fromJson(json['UsageType'] as Map<String, dynamic>),
        statusType: json['StatusType'] == null
            ? null
            : StatusType.fromJson(json['StatusType'] as Map<String, dynamic>),
        submissionStatus: json['SubmissionStatus'] == null
            ? null
            : SubmissionStatus.fromJson(
                json['SubmissionStatus'] as Map<String, dynamic>),
        userComments: json['UserComments'] as dynamic,
        percentageSimilarity: json['PercentageSimilarity'] as dynamic,
        mediaItems: json['MediaItems'] as dynamic,
        isRecentlyVerified: json['IsRecentlyVerified'] as bool?,
        dateLastVerified: json['DateLastVerified'] as String?,
        id: json['ID'],
        uuid: json['UUID'] as String?,
        parentChargePointId: json['ParentChargePointID'] as dynamic,
        dataProviderId: json['DataProviderID'] as int?,
        dataProvidersReference: json['DataProvidersReference'] as dynamic,
        operatorId: json['OperatorID'] as int?,
        operatorsReference: json['OperatorsReference'] as dynamic,
        usageTypeId: json['UsageTypeID'] as int?,
        usageCost: json['UsageCost'] as dynamic,
        addressInfo:
            AddressInfo.fromJson(json['AddressInfo'] as Map<String, dynamic>),
        connections: (json['Connections'] as List<dynamic>?)
            ?.map((e) => Connection.fromJson(e as Map<String, dynamic>))
            .toList(),
        numberOfPoints: json['NumberOfPoints'] as int?,
        generalComments: json['GeneralComments'] as dynamic,
        datePlanned: json['DatePlanned'] as dynamic,
        dateLastConfirmed: json['DateLastConfirmed'] as dynamic,
        statusTypeId: json['StatusTypeID'] as int?,
        dateLastStatusUpdate: json['DateLastStatusUpdate'] as String?,
        metadataValues: json['MetadataValues'] as dynamic,
        dataQualityLevel: json['DataQualityLevel'] as int?,
        dateCreated: json['DateCreated'] as String?,
        submissionStatusTypeId: json['SubmissionStatusTypeID'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'DataProvider': dataProvider?.toJson(),
        'OperatorInfo': operatorInfo?.toJson(),
        'UsageType': usageType?.toJson(),
        'StatusType': statusType?.toJson(),
        'SubmissionStatus': submissionStatus?.toJson(),
        'UserComments': userComments,
        'PercentageSimilarity': percentageSimilarity,
        'MediaItems': mediaItems,
        'IsRecentlyVerified': isRecentlyVerified,
        'DateLastVerified': dateLastVerified,
        'ID': id,
        'UUID': uuid,
        'ParentChargePointID': parentChargePointId,
        'DataProviderID': dataProviderId,
        'DataProvidersReference': dataProvidersReference,
        'OperatorID': operatorId,
        'OperatorsReference': operatorsReference,
        'UsageTypeID': usageTypeId,
        'UsageCost': usageCost,
        'AddressInfo': addressInfo?.toJson(),
        'Connections': connections?.map((e) => e.toJson()).toList(),
        'NumberOfPoints': numberOfPoints,
        'GeneralComments': generalComments,
        'DatePlanned': datePlanned,
        'DateLastConfirmed': dateLastConfirmed,
        'StatusTypeID': statusTypeId,
        'DateLastStatusUpdate': dateLastStatusUpdate,
        'MetadataValues': metadataValues,
        'DataQualityLevel': dataQualityLevel,
        'DateCreated': dateCreated,
        'SubmissionStatusTypeID': submissionStatusTypeId,
      };
}
