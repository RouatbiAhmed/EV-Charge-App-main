import 'connection_type.dart';
import 'current_type.dart';
import 'level.dart';
import 'status_type.dart';

class Connection {
  int? id;
  int? connectionTypeId;
  ConnectionType? connectionType;
  dynamic reference;
  int? statusTypeId;
  StatusType? statusType;
  int? levelId;
  Level? level;
  int? amps;
  int? voltage;
  int? powerKw;
  int? currentTypeId;
  CurrentType? currentType;
  int? quantity;
  dynamic comments;

  Connection({
    this.id,
    this.connectionTypeId,
    this.connectionType,
    this.reference,
    this.statusTypeId,
    this.statusType,
    this.levelId,
    this.level,
    this.amps,
    this.voltage,
    this.powerKw,
    this.currentTypeId,
    this.currentType,
    this.quantity,
    this.comments,
  });

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        id: json['ID'] as int?,
        connectionTypeId: json['ConnectionTypeID'] as int?,
        connectionType: json['ConnectionType'] == null
            ? null
            : ConnectionType.fromJson(
                json['ConnectionType'] as Map<String, dynamic>),
        reference: json['Reference'] as dynamic,
        statusTypeId: json['StatusTypeID'] as int?,
        statusType: json['StatusType'] == null
            ? null
            : StatusType.fromJson(json['StatusType'] as Map<String, dynamic>),
        levelId: json['LevelID'] as int?,
        level: json['Level'] == null
            ? null
            : Level.fromJson(json['Level'] as Map<String, dynamic>),
        amps: json['Amps'] as int?,
        voltage: json['Voltage'] as int?,
        powerKw: json['PowerKW'] as int?,
        currentTypeId: json['CurrentTypeID'] as int?,
        currentType: json['CurrentType'] == null
            ? null
            : CurrentType.fromJson(json['CurrentType'] as Map<String, dynamic>),
        quantity: json['Quantity'] as int?,
        comments: json['Comments'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'ConnectionTypeID': connectionTypeId,
        'ConnectionType': connectionType?.toJson(),
        'Reference': reference,
        'StatusTypeID': statusTypeId,
        'StatusType': statusType?.toJson(),
        'LevelID': levelId,
        'Level': level?.toJson(),
        'Amps': amps,
        'Voltage': voltage,
        'PowerKW': powerKw,
        'CurrentTypeID': currentTypeId,
        'CurrentType': currentType?.toJson(),
        'Quantity': quantity,
        'Comments': comments,
      };
}
