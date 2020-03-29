/*class CovidCasesModel {
  String country;
  String province;
  double lat;
  double long;
  DateTime date;
  int cases;
  String status;

  CovidCasesModel({
    this.country,
    this.province,
    this.lat,
    this.long,
    this.date,
    this.cases,
    this.status
  });

  double _parseDouble(String number) {
    return (number == '' || number == '0' || number == null || number == 'null') ? 0.0 : double.parse(number);
  }

  CovidCasesModel.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    province = json['Province'];
    lat = _parseDouble(json['Lat'].toString());
    long = _parseDouble(json['Long'].toString());
    date = DateTime.parse(json['Date']);
    cases = json['Cases'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['province'] = this.province;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['date'] = this.date;
    data['cases'] = this.cases;
    data['status'] = this.status;
    return data;
  }
}*/