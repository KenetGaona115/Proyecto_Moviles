import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Models/store.dart';

class ItemStore extends StatefulWidget {
  final Store store;
  ItemStore({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  _ItemStoreState createState() => _ItemStoreState();
}

class _ItemStoreState extends State<ItemStore> {
  var x = Icons.favorite;
  Color setColor(){
      if (widget.store.liked == false) {
          return Colors.white;
        } else {
          return Colors.green;
        }
    }
  @override
  Widget build(BuildContext context) {
    //return Container(child: Text("${widget.drink.productTitle}"));
    _liked() {
    Color color_x;
        if (widget.store.liked == false) {
          color_x = setColor();
          widget.store.liked = true;
        } else {
          color_x = setColor();
          widget.store.liked = false;
        }
    }

    void _openDrinksDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            /*
            return ItemStoreDetails(
              drink: widget.store,
            );
            */
          },
        ),
      );
    }
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 210,
          width: double.maxFinite,
          child: GestureDetector(
            onTap: _openDrinksDetails,
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.all(8.0),
              color: Theme.of(context).cardColor,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              "${widget.store.storeName}",
                              style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Text(
                              "💲"
                              "${widget.store.storeDescription}",
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      child: Image.network(
                        "${widget.store.storeImage}",
                        fit: BoxFit.fitHeight,
                        height: 180,
                      ),
                    ),
                    flex: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 150),
                    child: IconButton(
                        icon: Icon(x, color: setColor()),
                        onPressed: () {
                          setState(() {
                            _liked();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
