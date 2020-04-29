import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proyecto_final_moviles/maps/mapa.dart';

class AboutStore extends StatefulWidget {
  Store tienda;
  AboutStore({@required this.tienda, key}) : super(key: key);

  @override
  _AboutStoreState createState() => _AboutStoreState();
}

CameraPosition _initialPosition = CameraPosition(target: LatLng(10, 30.8025));
Completer<GoogleMapController> _controller;

void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}

final double _zoom = 10;
final Set<Marker> _markers = Set();

class _AboutStoreState extends State<AboutStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = Completer();
  }

  MapType _defaultMapType = MapType.normal;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Informacion"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .3,
                child: Stack(
                  alignment: Alignment(0.0, 0.0),
                  fit: StackFit.loose,
                  children: <Widget>[
                    //Espacio para poner el mapa
                    Positioned.fill(
                      bottom: 50,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        child: Stack(
                          children: <Widget>[
                            GoogleMap(
                              mapType: _defaultMapType,
                              markers: _markers,
                              onMapCreated: _onMapCreated,
                              myLocationEnabled: true,
                              initialCameraPosition: _initialPosition,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.gps_fixed,
                                  color: PRIMARY_COLOR,
                                ),
                                onPressed: _iraubicacion),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * .08,
                        backgroundImage: NetworkImage(_checkImage()),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "PUNTUACION",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar(
                initialRating: widget.tienda.cal,
                glowColor: Colors.grey,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                allowHalfRating: true,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                unratedColor: SECOND_COLOR,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color(0xffffc600),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                ignoreGestures: true,
              ),
              _returnTable(),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  color: CARD_COLOR,
                  splashColor: PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black)),
                  onLongPress: () => _displaySnackBar(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Contactar",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.call),
                    ],
                  ),
                  onPressed: () {
                    launch("tel://${widget.tienda.tel}");
                  },
              ),
              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }

//Widget de tabla
  Widget _returnTable() {
    return DataTable(
      dataRowHeight: 35,
      columns: [
        DataColumn(label: Text('Dia')),
        DataColumn(label: Text('Abre')),
        DataColumn(label: Text('Cierra')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('LUNES')),
          DataCell(Text('${widget.tienda.horario[0]}')),
          DataCell(Text('${widget.tienda.horario[1]}')),
        ]),
        DataRow(cells: [
          DataCell(Text('MARTES')),
          DataCell(Text('${widget.tienda.horario[2]}')),
          DataCell(Text('${widget.tienda.horario[3]}')),
        ]),
        DataRow(cells: [
          DataCell(Text('MIERCOLES')),
          DataCell(Text('${widget.tienda.horario[4]}')),
          DataCell(Text('${widget.tienda.horario[5]}')),
        ]),
        DataRow(cells: [
          DataCell(Text('JUEVES')),
          DataCell(Text('${widget.tienda.horario[6]}')),
          DataCell(Text('${widget.tienda.horario[7]}')),
        ]),
        DataRow(cells: [
          DataCell(Text('VIERNES')),
          DataCell(Text('${widget.tienda.horario[8]}')),
          DataCell(Text('${widget.tienda.horario[9]}')),
        ]),
        DataRow(cells: [
          DataCell(Text('SABADO')),
          DataCell(Text('${widget.tienda.horario[10]}')),
          DataCell(Text('${widget.tienda.horario[11]}')),
        ]),
        DataRow(cells: [
          DataCell(Text('DOMINGO')),
          DataCell(Text('${widget.tienda.horario[12]}')),
          DataCell(Text('${widget.tienda.horario[13]}')),
        ]),
      ],
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Precione para llamar'));
    _scaffoldKey.currentState..showSnackBar(snackBar);
  }

  _checkImage() {
    if (widget.tienda.logo == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return widget.tienda.logo;
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
          infoWindow: InfoWindow(
            title: 'El pichi',
          ),
        ),
      );
    });
  }
}
