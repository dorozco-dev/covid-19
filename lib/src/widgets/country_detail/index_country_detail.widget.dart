import 'package:covid_19/src/models/all_map.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_icons/line_icons.dart';

class IndexCountryDetailWidget extends StatefulWidget {
  final CoronavirusModel coronavirusModel;

  const IndexCountryDetailWidget({Key key, this.coronavirusModel})
      : super(key: key);
  @override
  _IndexCountryDetailWidgetState createState() =>
      _IndexCountryDetailWidgetState();
}

class _IndexCountryDetailWidgetState extends State<IndexCountryDetailWidget> {
  int recuperacion = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      recuperacion = (widget.coronavirusModel.cases -
          widget.coronavirusModel.deaths -
          widget.coronavirusModel.recovered);
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
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              Text(widget.coronavirusModel.country, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
            ],
          ),
        ),
        _buildTile(
          Padding(
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
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Text(widget.coronavirusModel.cases.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0))
                    ],
                  ),
                  Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(LineIcons.briefcase,
                            color: Colors.white, size: 30.0),
                      )))
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.teal,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(LineIcons.warning,
                            color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Muertes',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text(widget.coronavirusModel.deaths.toString(),
                      style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.purple,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(LineIcons.leaf,
                            color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Sanos',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text(widget.coronavirusModel.recovered.toString(),
                      style: TextStyle(color: Colors.white)),
                ]),
          ),
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
      ],
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white30,
        //shadowColor: Colors.white,
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
