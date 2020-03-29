import 'country_info.model.dart';

class CoronavirusModel {
  String country;
  CountryInfoModel countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  String casesPerOneMillion;
  String deathsPerOneMillion;

  CoronavirusModel({
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion
  });

  // Create a Note from JSON data
  factory CoronavirusModel.fromJson(Map<String, dynamic> json) => new CoronavirusModel(
      country: json["country"],
      countryInfo: CountryInfoModel.fromJson(json["countryInfo"]),
      cases: json["cases"],
      todayCases: json["todayCases"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"],
      active: json["active"],
      critical: json["critical"],
      casesPerOneMillion: json["casesPerOneMillion"].toString(),
      deathsPerOneMillion: json["deathsPerOneMillion"].toString()
  );

  // Convert our Note to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
    "country": country,
    "countryInfo": countryInfo,
    "cases": cases,
    "todayCases": todayCases,
    "deaths": deaths,
    "todayDeaths": todayDeaths,
    "recovered": recovered,
    "active": active,
    "critical": critical,
    "casesPerOneMillion": casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion
  };
}