import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        title: Text("About ${widget.tienda.nombre}"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(_checkImage()),
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.blueGrey,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Califiacion del restaurante",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar(
              initialRating: 2.5,
              glowColor: Colors.grey,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
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
                onPressed: () {})
          ],
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
          DataCell(Text('1')),
          DataCell(Text('2')),
        ]),
        DataRow(cells: [
          DataCell(Text('MARTES')),
          DataCell(Text('1')),
          DataCell(Text('21')),
        ]),
        DataRow(cells: [
          DataCell(Text('MIERCOLES')),
          DataCell(Text('12')),
          DataCell(Text('122')),
        ]),
        DataRow(cells: [
          DataCell(Text('JUEVES')),
          DataCell(Text('212')),
          DataCell(Text('4')),
        ]),
        DataRow(cells: [
          DataCell(Text('VIERNES')),
          DataCell(Text('1')),
          DataCell(Text('2')),
        ]),
        DataRow(cells: [
          DataCell(Text('SABADO')),
          DataCell(Text('5')),
          DataCell(Text('4')),
        ]),
        DataRow(cells: [
          DataCell(Text('DOMINGO')),
          DataCell(Text('4')),
          DataCell(Text('5')),
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
