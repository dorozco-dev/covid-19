import 'package:covid_19/src/models/all_map.model.dart';
import 'package:covid_19/src/models/total_cases.model.dart';
//import 'package:covid_19/src/models/country.model.dart';
//import 'package:covid_19/src/models/covid_cases.model.dart';
//import 'package:covid_19/src/models/summary_case.model.dart';
import 'package:covid_19/src/utils/services.uil.dart';

class CovidService {

  ServiceUtil serviceUtil = new ServiceUtil();
  
  /*Future<List<CountryModel>> getCountries() async {
    List<dynamic> list = await serviceUtil.get('https://api.covid19api.com/countries');
    List<CountryModel> listCountry = list.map((item) => CountryModel.fromJson(item)).toList();
    listCountry = listCountry.where((country) => country.country != "").toList();
    listCountry.sort((a, b) => a.country.toLowerCase().compareTo(b.country.toLowerCase()));
    return listCountry;
  }*/

  /*Future<SummaryModel> getSummaryByCountry(String country) async {
    var data = await serviceUtil.get('https://api.covid19api.com/summary');
    var listCases = data['Countries'].map((item) => SummaryModel.fromJson(item)).toList();
    var caseModel = listCases.where((item) => item.slug == country).toList();
    return caseModel[0];
  }*/

  /*Future<List<CovidCasesModel>> getByCountry(String country) async {
    List<dynamic> list = await serviceUtil.get('https://api.covid19api.com/country/$country/status/confirmed');
    List<CovidCasesModel> listCases = list.map((item) => CovidCasesModel.fromJson(item)).toList();
    return listCases;
  }*/


  //En esta parte se consume otro proveedor
  Future<List<CoronavirusModel>> fetchAllCountries() async {
    List<dynamic> data = await serviceUtil.get('https://corona.lmao.ninja/countries/');
      List<CoronavirusModel> list = data.map((dynamic item) => CoronavirusModel.fromJson(item)).toList();
      list.sort((a, b) => a.country.toLowerCase().compareTo(b.country.toLowerCase()));
      return list;
  }

  Future<TotalCasesModel> fetchAllTotalice() async {
    dynamic data = await serviceUtil.get('https://corona.lmao.ninja/all');
    TotalCasesModel resultCases = TotalCasesModel.fromJson(data);
    return resultCases;
  }
}