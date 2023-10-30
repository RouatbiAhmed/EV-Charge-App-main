class Country {
  String? isoCode;
  String? continentCode;
  int? id;
  String? title;

  Country({this.isoCode, this.continentCode, this.id, this.title});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        isoCode: json['ISOCode'] as String?,
        continentCode: json['ContinentCode'] as String?,
        id: json['ID'] as int?,
        title: json['Title'] as String?,
      );


}
