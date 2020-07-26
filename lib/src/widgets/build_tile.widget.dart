import 'package:flutter/material.dart';

class BuildTileWidget extends StatefulWidget {
  final Widget child;
  final Function() onTap;

  const BuildTileWidget({Key key, this.child, this.onTap}) : super(key: key);
  @override
  _BuildTileWidgetState createState() => _BuildTileWidgetState();
}

class _BuildTileWidgetState extends State<BuildTileWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        //shadowColor: Colors.white,
        child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
            onTap: widget.onTap != null
                ? () => widget.onTap()
                : () {
              print('Not set yet');
            },
            child: widget.child));
  }
}