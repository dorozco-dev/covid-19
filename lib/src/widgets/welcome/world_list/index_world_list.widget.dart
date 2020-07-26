import 'package:covid_19/src/models/all_map.model.dart';
import 'package:covid_19/src/services/covid.service.dart';
import 'package:covid_19/src/utils/scree_are_size.util.dart';
import 'package:covid_19/src/views/detail_country.view.dart';
import 'package:covid_19/src/widgets/build_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class IndexWorldList extends StatefulWidget {
  @override
  _IndexWorldListState createState() => _IndexWorldListState();
}

class _IndexWorldListState extends State<IndexWorldList> {
  List<CoronavirusModel> listCountry,
      _listCountry,
      sampleListCountry = new List<CoronavirusModel>();
  TextEditingController controller = new TextEditingController();
  String filter;

  CovidService covidSerive = new CovidService();

  getData() async {
    listCountry = await covidSerive.fetchAllCountries();
    setState(() {
      sampleListCountry = listCountry;
      _listCountry = listCountry;
    });
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (listCountry == null)
        ? Center(
            child: Center(child: CircularProgressIndicator()),
          )
        : Column(
            children: <Widget>[
              SizedBox(height: 15),
              Container(
                width: screenAwareSize(500, context),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: screenAwareSize(40, context),
                child: TextField(
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    labelText: "Buscar",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Buscar",
                    prefixIcon: Icon(LineIcons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _listCountry = sampleListCountry
                          .where((r) => (r.country
                          .toLowerCase()
                          .contains(text.trim().toLowerCase())))
                          .toList();
                    });
                  },
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _listCountry.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BuildTileWidget(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(top: BorderSide(width: 0.5, color: Color(0xFFFF000000)))
                          ),
                          child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailCountry(
                                              country: _listCountry[index],
                                            )));
                              },
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0,
                                            color: Colors.black26))),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      _listCountry[index].countryInfo.flag),
                                ),
                              ),
                              title: Text(
                                _listCountry[index].country,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(LineIcons.arrow_circle_o_right,
                                  color: Colors.black, size: 30.0)),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
  }
}
