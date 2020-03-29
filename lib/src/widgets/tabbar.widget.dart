import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      )
    );
  }
}