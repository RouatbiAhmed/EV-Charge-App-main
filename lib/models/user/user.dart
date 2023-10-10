class User {
  int? id;
  dynamic identityProvider;
  dynamic identifier;
  dynamic currentSessionToken;
  String? username;
  dynamic profile;
  dynamic location;
  dynamic websiteUrl;
  int? reputationPoints;
  dynamic permissions;
  dynamic permissionsRequested;
  dynamic dateCreated;
  dynamic dateLastLogin;
  dynamic isProfilePublic;
  dynamic isEmergencyChargingProvider;
  dynamic isPublicChargingProvider;
  dynamic latitude;
  dynamic longitude;
  dynamic emailAddress;
  dynamic emailHash;
  String? profileImageUrl;
  dynamic isCurrentSessionTokenValid;
  dynamic apiKey;
  dynamic syncedSettings;

  User({
    this.id,
    this.identityProvider,
    this.identifier,
    this.currentSessionToken,
    this.username,
    this.profile,
    this.location,
    this.websiteUrl,
    this.reputationPoints,
    this.permissions,
    this.permissionsRequested,
    this.dateCreated,
    this.dateLastLogin,
    this.isProfilePublic,
    this.isEmergencyChargingProvider,
    this.isPublicChargingProvider,
    this.latitude,
    this.longitude,
    this.emailAddress,
    this.emailHash,
    this.profileImageUrl,
    this.isCurrentSessionTokenValid,
    this.apiKey,
    this.syncedSettings,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['ID'] as int?,
        identityProvider: json['IdentityProvider'] as dynamic,
        identifier: json['Identifier'] as dynamic,
        currentSessionToken: json['CurrentSessionToken'] as dynamic,
        username: json['Username'] as String?,
        profile: json['Profile'] as dynamic,
        location: json['Location'] as dynamic,
        websiteUrl: json['WebsiteURL'] as dynamic,
        reputationPoints: json['ReputationPoints'] as int?,
        permissions: json['Permissions'] as dynamic,
        permissionsRequested: json['PermissionsRequested'] as dynamic,
        dateCreated: json['DateCreated'] as dynamic,
        dateLastLogin: json['DateLastLogin'] as dynamic,
        isProfilePublic: json['IsProfilePublic'] as dynamic,
        isEmergencyChargingProvider:
            json['IsEmergencyChargingProvider'] as dynamic,
        isPublicChargingProvider: json['IsPublicChargingProvider'] as dynamic,
        latitude: json['Latitude'] as dynamic,
        longitude: json['Longitude'] as dynamic,
        emailAddress: json['EmailAddress'] as dynamic,
        emailHash: json['EmailHash'] as dynamic,
        profileImageUrl: json['ProfileImageURL'] as String?,
        isCurrentSessionTokenValid:
            json['IsCurrentSessionTokenValid'] as dynamic,
        apiKey: json['APIKey'] as dynamic,
        syncedSettings: json['SyncedSettings'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'IdentityProvider': identityProvider,
        'Identifier': identifier,
        'CurrentSessionToken': currentSessionToken,
        'Username': username,
        'Profile': profile,
        'Location': location,
        'WebsiteURL': websiteUrl,
        'ReputationPoints': reputationPoints,
        'Permissions': permissions,
        'PermissionsRequested': permissionsRequested,
        'DateCreated': dateCreated,
        'DateLastLogin': dateLastLogin,
        'IsProfilePublic': isProfilePublic,
        'IsEmergencyChargingProvider': isEmergencyChargingProvider,
        'IsPublicChargingProvider': isPublicChargingProvider,
        'Latitude': latitude,
        'Longitude': longitude,
        'EmailAddress': emailAddress,
        'EmailHash': emailHash,
        'ProfileImageURL': profileImageUrl,
        'IsCurrentSessionTokenValid': isCurrentSessionTokenValid,
        'APIKey': apiKey,
        'SyncedSettings': syncedSettings,
      };
}
