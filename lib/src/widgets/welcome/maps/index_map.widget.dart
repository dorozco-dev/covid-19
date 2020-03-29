import 'dart:async';
import 'dart:typed_data';


import 'package:covid_19/src/models/all_map.model.dart';
import 'package:covid_19/src/models/country_info.model.dart';
import 'package:covid_19/src/services/covid.service.dart';
import 'package:covid_19/src/utils/assets.util.dart';
import 'package:covid_19/src/utils/location.util.dart';
import 'package:covid_19/src/utils/theme.util.dart';
import 'package:covid_19/src/views/detail_country.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IndexMap extends StatefulWidget {
  @override
  _IndexMapState createState() => _IndexMapState();
}

class _IndexMapState extends State<IndexMap> {
  AssetsUtil assetsUtil = new AssetsUtil();
  CameraPosition _initialPosition = CameraPosition(target: LatLng(100,1));
  CovidService covidService = new CovidService();
  List<Marker> listMarker = [];
  GoogleMapController _controller;
  LocationUtil locationUtil =  new LocationUtil();

  //InfoWindow
  CoronavirusModel _currentPinData = CoronavirusModel(
      country: '',
      countryInfo: CountryInfoModel(
        flag: ''
      ),
      cases: 0,
      deaths: 0
  );
  double _pinPillPosition = -100;

  @override
  void initState() {
    super.initState();
    updatePositionCameraByLocation();
    getData();
  }

  void updatePositionCameraByLocation() async {
    locationUtil.getLatAndLong().then((latLong) async => {
      _controller.animateCamera(CameraUpdate.newLatLngZoom(latLong, 3))
    });
  }

  getData() async {
    Uint8List uint8listIcon = await assetsUtil.getBytesFromAsset('assets/coronadetails.png', 35);
    List<CoronavirusModel> list = await covidService.fetchAllCountries();
    List<Marker> listMarkers = [];
    for(CoronavirusModel country in list) {
      listMarkers.add(Marker(
          markerId: MarkerId(country.country),
          icon: BitmapDescriptor.fromBytes(uint8listIcon),
          draggable: true,
          onTap: () {
            setState(() {
              _currentPinData = country;
              _pinPillPosition = 0;
            });
          },
          position: LatLng(country.countryInfo.lat, country.countryInfo.long)
      ));
    }
    setState(() {
      listMarker = listMarkers;
    });
  }

  changeMapMode() {
    getJsonFile("assets/nightmode.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    changeMapMode();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationEnabled: false,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: _initialPosition,
          markers: Set.from(listMarker),
        ),
        AnimatedPositioned(
          bottom: _pinPillPosition,
          right: 0,
          left: 0,
          duration: Duration(milliseconds: 200),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(20),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 20,
                      offset: Offset.zero,
                      color: Colors.grey.withOpacity(0.5),
                    )
                  ]),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailCountry(country: _currentPinData,))
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildAvatar(),
                    _buildLocationInfo(),
                    //_buildMarkerType()
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 50,
      height: 50,
      child: ClipOval(
        child: Image.network(_currentPinData.countryInfo.flag,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _buildLocationInfo() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _currentPinData.country,
              style: CustomAppTheme().data.textTheme.title,
            ),
            Text(
              'Total Casos : ${_currentPinData.cases}',
              style: CustomAppTheme().data.textTheme.display1,
            ),
            Text(
              'Total Muertes : ${_currentPinData.deaths}',
              style: CustomAppTheme().data.textTheme.display1,
            )
          ],
        ),
      ),
    );
  }
}