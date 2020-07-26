import 'package:covid_19/src/models/all_map.model.dart';
import 'package:covid_19/src/models/total_cases.model.dart';
import 'package:covid_19/src/widgets/country_detail/index_country_detail.widget.dart';
import 'package:covid_19/src/widgets/detail_info.widget.dart';
import 'package:flutter/material.dart';

class DetailCountry extends StatefulWidget {
  final CoronavirusModel country;

  const DetailCountry({Key key, this.country}) : super(key: key);

  @override
  _DetailCountryState createState() => _DetailCountryState();
}

class _DetailCountryState extends State<DetailCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Text(widget.country.country)),
        ),
      ),
      body: (widget.country == null)
          ? Center(
              child: Center(child: CircularProgressIndicator()),
            )
          : DetailWidget(totalCasesModel: TotalCasesModel(deaths: widget.country.deaths, cases: widget.country.cases, recovered: widget.country.recovered),),
    );
  }
}
