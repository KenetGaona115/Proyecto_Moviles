import 'package:flutter/material.dart';

class Pago extends StatefulWidget {
  Pago({Key key}) : super(key: key);

  @override
  _PagoState createState() => _PagoState();
}

class _PagoState extends State<Pago> {
  _aviso() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Image.network(
                "https://alnavio.com/fotos/1/coffee-2698126_960_720.jpg"),
            Row(
              children: <Widget>[
                Image.network(
                  "https://images.vexels.com/media/users/3/131087/isolated/preview/d8b847791d5b299a63ced22fbacc95e3-icono-de-taza-de-t--caliente-by-vexels.png",
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "¡Orden exitosa!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("Pedido"),
                  ],
                  
                ),
               
              ],
              
            ),
             Column(children: <Widget>[
                  Text("Tu orden ha sido registrada, para más información busca en la opción historial de compras de tu perfil")
                ],
                ),
            new FlatButton(
              child: new Text("ACEPTAR"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Center(
              child: Text(
                "Elige tu metódo de pago:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans"),
              ),
            ),
          ),
          Center(
              child: Container(
                  child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: _aviso,
                child: Card(
                  color: Theme.of(context).buttonColor,
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "https://images.vexels.com/media/users/3/129923/isolated/preview/23c69d5178087b811dd1196cf6274613-icono-de-tarjetas-de-credito-by-vexels.png",
                        width: 150,
                        height: 150,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Tarjeta de credito",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        flex: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Icon(Icons.mode_edit),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).buttonColor,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      "https://logodownload.org/wp-content/uploads/2014/10/paypal-logo-3.png",
                      width: 150,
                      height: 150,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Text(
                          "PayPal",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Icon(Icons.mode_edit),
                    )
                  ],
                ),
              ),
              Card(
                color: Theme.of(context).buttonColor,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      "https://cdn.iconscout.com/icon/premium/png-256-thumb/gift-card-5-553125.png",
                      width: 200,
                      height: 150,
                    ),
                    Expanded(
                      child: Text(
                        "Tarjeta de regalo",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Icon(Icons.mode_edit),
                    )
                  ],
                ),
              ),
            ],
          ),
          ),
          )
        ],
      ),
    );
  }
}