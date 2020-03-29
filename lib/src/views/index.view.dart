import 'package:covid_19/src/widgets/about.widget.dart';
import 'package:covid_19/src/widgets/welcome/information.widget.dart';
import 'package:covid_19/src/widgets/welcome/info_general/info_general.widget.dart';
import 'package:covid_19/src/widgets/welcome/maps/index_map.widget.dart';
import 'package:covid_19/src/widgets/welcome/world_list/index_world_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int actualChart = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("COVID-19"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(LineIcons.map)),
              Tab(icon: Icon(LineIcons.globe)),
              Tab(icon: Icon(LineIcons.list)),
              Tab(icon: Icon(LineIcons.info)),
              Tab(icon: Icon(LineIcons.android))
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            IndexMap(),
            InfoGeneral(),
            IndexWorldList(),
            Information(),
            AboutWidget()
          ],
        )
      ),
    );
  }
}