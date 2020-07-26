import 'package:covid_19/src/models/total_cases.model.dart';
import 'package:covid_19/src/services/covid.service.dart';
import 'package:covid_19/src/widgets/detail_info.widget.dart';
import 'package:flutter/material.dart';

class InfoGeneral extends StatefulWidget {
  @override
  InfoGeneralState createState() => InfoGeneralState();
}

class InfoGeneralState extends State<InfoGeneral> {
  CovidService covidService = new CovidService();
  TotalCasesModel totalCasesModel;

  getData() async {
    TotalCasesModel data = await covidService.fetchAllTotalice();

    setState(() {
      totalCasesModel = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return (totalCasesModel == null)
        ? Center(
            child: Center(child: CircularProgressIndicator()),
          )
        : DetailWidget(
            totalCasesModel: totalCasesModel,
          );
  }
}
