import 'package:covid_19/src/models/all_map.model.dart';
import 'package:covid_19/src/services/covid.service.dart';
import 'package:covid_19/src/utils/scree_are_size.util.dart';
import 'package:covid_19/src/views/detail_country.view.dart';
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'ESTADO MUNDIAL',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                width: screenAwareSize(300, context),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: screenAwareSize(40, context),
                decoration: BoxDecoration(
                    color: Color(0xFF262626),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: TextField(
                  style: new TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15.0),
                    border: InputBorder.none,
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(LineIcons.search, color: Colors.grey),
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
              Expanded(
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _listCountry.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
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
                                            color: Colors.white24))),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      _listCountry[index].countryInfo.flag),
                                ),
                              ),
                              title: Text(
                                _listCountry[index].country,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(LineIcons.arrow_circle_o_right,
                                  color: Colors.white, size: 30.0)),
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
