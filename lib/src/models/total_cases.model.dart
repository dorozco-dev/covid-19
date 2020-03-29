class TotalCasesModel {
  int cases;
  int deaths;
  int recovered;
  DateTime updated;
  int active;

  TotalCasesModel({
    this.cases,
    this.deaths,
    this.recovered,
    this.updated,
    this.active
  });

  TotalCasesModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    updated = DateTime.fromMicrosecondsSinceEpoch(json['updated'] * 1000);
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['updated'] = this.updated;
    data['active'] = this.active;
    return data;
  }
}