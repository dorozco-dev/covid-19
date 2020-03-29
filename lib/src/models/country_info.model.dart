class CountryInfoModel {
  String iso2;
  String iso3;
  String id;
  double lat;
  double long;
  String flag;

  CountryInfoModel({
    this.iso2,
    this.iso3,
    this.id,
    this.lat,
    this.long,
    this.flag
  });

  double _parseDouble(String number) {
    return (number == '' || number == '0' || number == null || number == 'null') ? 0.0 : double.parse(number);
  }

  CountryInfoModel.fromJson(Map<String, dynamic> json) {
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    id = json['_id'].toString();
    lat = _parseDouble(json['lat'].toString());
    long = _parseDouble(json['long'].toString());
    flag = json['flag'];
  }

  // Convert our Note to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
    "iso2": iso2,
    "iso3": iso3,
    "_id": id,
    "lat": lat,
    "long": long,
    "flag": flag,
  };
}