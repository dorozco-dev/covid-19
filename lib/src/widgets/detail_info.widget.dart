import 'package:covid_19/src/models/total_cases.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pie_chart/pie_chart.dart';

import 'build_tile.widget.dart';

class DetailWidget extends StatefulWidget {
  final TotalCasesModel totalCasesModel;

  const DetailWidget({Key key, this.totalCasesModel}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  Map<String, double> dataMap = new Map<String, double>();
  Color deathsColor = Colors.red[500];
  Color casesColor = Colors.orange[300];
  Color recoveredColor = Colors.green[500];

  @override
  void initState() {
    super.initState();
    Map<String, double> listData = Map<String, double>();
    listData.putIfAbsent("Casos", () => double.parse(widget.totalCasesModel.cases.toString()));
    listData.putIfAbsent("Muertes", () => double.parse(widget.totalCasesModel.deaths.toString()));
    listData.putIfAbsent("Sanos", () => double.parse(widget.totalCasesModel.recovered.toString()));

    setState(() {
      dataMap = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        BuildTileWidget(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: PieChart(
                      dataMap: dataMap,
                      colorList: [casesColor, deathsColor, recoveredColor],
                      chartValueStyle: TextStyle(color: Colors.white),
                      legendPosition: LegendPosition.left,
                      legendStyle: TextStyle(fontSize: 20, ),
                      //showChartValueLabel: true,
                      //legendFontColor: Colors.blueGrey[900],
                      //legendFontSize: 14.0,
                      //legendFontWeight: FontWeight.w500,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32.0,
                      chartRadius: MediaQuery.of(context).size.width / 2.7,
                      showChartValuesInPercentage: true,
                      showChartValues: true,
                      //chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                    ),
                  )
                ]),
          ),
        ),
        BuildTileWidget(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Total de casos',
                            style: TextStyle(color: Colors.black)),
                        Text(widget.totalCasesModel.cases.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 34.0))
                      ],
                    ),
                    Material(
                        color: casesColor,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(LineIcons.briefcase,
                                  color: Colors.white, size: 30.0),
                            )))
                  ]),
            )
        ),
        BuildTileWidget(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: deathsColor,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(LineIcons.warning,
                            color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Muertes',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text(widget.totalCasesModel.deaths.toString(),
                      style: TextStyle(color: Colors.black)),
                ]),
          ),
        ),
        BuildTileWidget(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: recoveredColor,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(LineIcons.leaf,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Sanos',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text(widget.totalCasesModel.recovered.toString(),
                        style: TextStyle(color: Colors.black)),
                  ]),
            )
        ),
      ],
      staggeredTiles: [
        //StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(2, 200.0),
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
      ],
    );
  }
}