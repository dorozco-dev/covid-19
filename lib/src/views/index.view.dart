import 'package:covid_19/src/app.dart';
import 'package:covid_19/src/widgets/about.widget.dart';
import 'package:covid_19/src/widgets/welcome/info_general/info_general.widget.dart';
import 'package:covid_19/src/widgets/information.widget.dart';
import 'package:covid_19/src/widgets/welcome/maps/index_map.widget.dart';
import 'package:covid_19/src/widgets/welcome/world_list/index_world_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:line_icons/line_icons.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int currentIndex;
  List<String> _namePage = [
    'Inicio',
    'Información general',
    'Países',
    'Prevenciones',
    'Acerca de'
  ];
  List<Widget> _pages = [
    IndexMap(),
    InfoGeneral(),
    IndexWorldList(),
    Information(),
    AboutWidget()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Text(_namePage[currentIndex])),
        ),
        /*actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutWidget()));
                },
                child: Icon(
                  LineIcons.android,
                  size: 26.0,
                ),
              )
          ),
        ],*/
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),*/
      body: _pages[currentIndex],
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        //fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                LineIcons.globe,
                color: Colors.black,
              ),
              activeIcon: Icon(
                LineIcons.globe,
                color: Colors.red,
              ),
              title: Text("")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                LineIcons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                LineIcons.dashboard,
                color: Colors.deepPurple,
              ),
              title: Text("")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                LineIcons.list,
                color: Colors.black,
              ),
              activeIcon: Icon(
                LineIcons.list,
                color: Colors.indigo,
              ),
              title: Text("")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                LineIcons.info_circle,
                color: Colors.black,
              ),
              activeIcon: Icon(
                LineIcons.info_circle,
                color: Colors.green,
              ),
              title: Text("")),
          BubbleBottomBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(
                LineIcons.android,
                color: Colors.black,
              ),
              activeIcon: Icon(
                LineIcons.android,
                color: Colors.purple,
              ),
              title: Text(""))
        ],
      ),
    );
  }
}
