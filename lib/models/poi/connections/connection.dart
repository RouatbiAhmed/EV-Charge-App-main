import 'connection_type.dart';

class Connection {
  ConnectionType connectionType;

  Connection({
    required this.connectionType,
  });

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        connectionType: ConnectionType.fromJson(json['KKConnectionType'] as Map<String, dynamic>),
      );

}

