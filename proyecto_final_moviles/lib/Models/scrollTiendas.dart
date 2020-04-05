import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:proyecto_final_moviles/Tienda/tienda.dart';

class ScrollTienda extends StatefulWidget {
  final Store tienda;
  ScrollTienda({Key key, this.tienda}) : super(key: key);

  @override
  _ScrollTiendaState createState() => _ScrollTiendaState();
}

class _ScrollTiendaState extends State<ScrollTienda> {
  Store model;
  @override
  void initState() {
    model = widget.tienda;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
        child: GestureDetector(
          onTap: () {
            print(model.nombre);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ShowStore(tienda: model)));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            margin: EdgeInsets.symmetric(vertical: !model.isSelected ? 20 : 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                        icon: Icon(
                          model.liked ? Icons.favorite : Icons.favorite_border,
                          color: model.liked ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            model.liked = !model.liked;
                          });
                        })),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: model.isSelected ? 15 : 0),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(_checkImage()),
                          radius: 70,
                        )
                      ],
                    ),
                    // SizedBox(height: 5),
                    Text("${model.nombre}",
                        style: TextStyle(
                          fontSize: model.isSelected ? 16 : 14,
                        )),
                    Text(
                      "${model.categoria}",
                      style: TextStyle(
                        fontSize: model.isSelected ? 14 : 12,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _checkImage() {
    if (model.logo == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return model.logo;
  }
}
