import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutStore extends StatefulWidget {
  Store tienda;
  AboutStore({@required this.tienda, key}) : super(key: key);

  @override
  _AboutStoreState createState() => _AboutStoreState();
}

class _AboutStoreState extends State<AboutStore> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height * .2,
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
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                ignoreGestures: true,
              ),
              _returnTable(),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                  color: Colors.blueGrey,
                  splashColor: Colors.lightBlue,
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
                      Icon(Icons.call)
                    ],
                  ),
                  onPressed: () {
                    launch("tel://${widget.tienda.tel}");
                  })
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
}
