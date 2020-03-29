import 'package:covid_19/src/models/all_map.model.dart';
import 'package:covid_19/src/widgets/country_detail/index_country_detail.widget.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        //title: Text(widget.country.country),
      ),
      body: (widget.country == null)
          ? Center(
              child: Center(child: CircularProgressIndicator()),
            )
          : IndexCountryDetailWidget(coronavirusModel: widget.country),
    );
  }
}
