import 'connection_type.dart';

class Connection {
  ConnectionType connectionType;

  Connection({
    required this.connectionType,
  });

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        connectionType: ConnectionType.fromJson(
            json['KKConnectionType'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'ConnectionType': connectionType.toJson(),
      };
}

/*
import 'connection_type.dart';

class Connection {
  ConnectionType? connectionType;

  Connection({
    this.connectionType,
  });

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        connectionType: json['ConnectionType'] == null
            ? null
            : ConnectionType.fromJson(
                json['ConnectionType'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'ConnectionType': connectionType?.toJson(),
      };
}
*/
