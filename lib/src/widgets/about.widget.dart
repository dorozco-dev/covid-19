import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            constraints: BoxConstraints(maxWidth: 768),
            child: ListView(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                children: <Widget>[
                  SectionCardWidget(title: 'About Me', description: 'Made by ❤. GitHub: dorozco-dev \n\n©2020 dorozco-dev. All Rights Reserved'),
                  SectionCardWidget(title: 'API', description: 'https://github.com/novelcovid/api')
                ])));
  }
}

class SectionCardWidget extends StatelessWidget {
  final String title;
  final String description;

  SectionCardWidget({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16),
        child: Card(
            child: Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(title),
                    subtitle: Padding(
                        padding: EdgeInsets.only(top: 8), child: Text(description)),
                  ),
                ],
              ),
            )));
  }
}