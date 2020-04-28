import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

CameraPosition _initialPosition = CameraPosition(target: LatLng(10, 30.8025));
Completer<GoogleMapController> _controller;

void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}

final double _zoom = 10;
final Set<Marker> _markers = Set();

class _MapaState extends State<Mapa> {
  @override
  void initState() {
    super.initState();
    _controller = Completer();
  }

  MapType _defaultMapType = MapType.normal;

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubicación'),
          centerTitle: true,
          actions: <Widget>[
 
          ],
        ),
        drawer: _drawer(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: _defaultMapType,
              markers: _markers,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: _initialPosition,
            ),
            Container(
              margin: EdgeInsets.only(top: 50, right: 20),
              alignment: Alignment.topRight,
              child: Column(children: <Widget>[
                FloatingActionButton(
                    child: Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      print('Mapa');
                      _iraubicacion();
                    }),
              ]),
            ),
          ],
        ));
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        child: new ListView(
          children: <Widget>[
 
            Divider(),
            ListTile(
              onTap: () {
                _iraubicacion();
                Navigator.of(context).pop();
              },
              title: new Text(
                "Hamburguesas El pichi",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              trailing: new Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _iraubicacion() async {
    double lat = 21.034598;
    double long = -104.371707;
    GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('pichi'),
          position: LatLng(lat, long),
          infoWindow:
              InfoWindow(title: 'El pichi', ),
        ),
      );
    });
  }
}