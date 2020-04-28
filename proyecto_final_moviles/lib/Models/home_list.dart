import 'package:proyecto_final_moviles/Models/categoria.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';

class HomeList {
  static List<Categoria> categoryList = [
    Categoria(
      categoria: "Hambugesas",
      id: 1,
      image: "https://i.ytimg.com/vi/dGJlpgaXgAA/maxresdefault.jpg",
      liked: false
    ),
    Categoria(
      categoria: "Sushi",
      id: 2,
      image: "https://scontent.fgdl5-3.fna.fbcdn.net/v/t1.0-9/15326531_1688258981504571_1307994158617097759_n.jpg?_nc_cat=107&_nc_sid=85a577&_nc_eui2=AeEHDdX-Ql6CWmG8Sv9cTD51h9gBxYbH0VmH2AHFhsfRWaGMb8LPeIjdFflOk6EzuC6YcLzgMB0qH7vo7oTVzTcS&_nc_ohc=4rL6v2XbsccAX_toh97&_nc_ht=scontent.fgdl5-3.fna&oh=79fa5493843e07c6674b3a00bdb6c47f&oe=5ECBD479",
      liked: true
    ),
    Categoria(
      categoria: "Tacos",
      id: 3,
      image: "https://scontent.fgdl5-3.fna.fbcdn.net/v/t1.0-9/15326531_1688258981504571_1307994158617097759_n.jpg?_nc_cat=107&_nc_sid=85a577&_nc_eui2=AeEHDdX-Ql6CWmG8Sv9cTD51h9gBxYbH0VmH2AHFhsfRWaGMb8LPeIjdFflOk6EzuC6YcLzgMB0qH7vo7oTVzTcS&_nc_ohc=4rL6v2XbsccAX_toh97&_nc_ht=scontent.fgdl5-3.fna&oh=79fa5493843e07c6674b3a00bdb6c47f&oe=5ECBD479",
      liked: false
    ),
    Categoria(
      categoria: "Nieve",
      id: 4,
      image: "https://impulsoedomex.com.mx/wp-content/uploads/2017/05/helado_extravagante.jpg",
      liked: false
    )
  ];
  static List<Store> restaurantList =[
    Store(
      id: 1,
      categoria: "Tacos",
      liked: true,
      logo: "https://scontent.fgdl5-3.fna.fbcdn.net/v/t1.0-9/15326531_1688258981504571_1307994158617097759_n.jpg?_nc_cat=107&_nc_sid=85a577&_nc_eui2=AeEHDdX-Ql6CWmG8Sv9cTD51h9gBxYbH0VmH2AHFhsfRWaGMb8LPeIjdFflOk6EzuC6YcLzgMB0qH7vo7oTVzTcS&_nc_ohc=4rL6v2XbsccAX_toh97&_nc_ht=scontent.fgdl5-3.fna&oh=79fa5493843e07c6674b3a00bdb6c47f&oe=5ECBD479",
      nombre: "Tacos",
      isSelected:true,
      cat_number: 3
    ),
    Store(
      id: 2,
      categoria: "Sushi",
      liked: false,
      logo: "https://scontent.fgdl5-3.fna.fbcdn.net/v/t1.0-9/15326531_1688258981504571_1307994158617097759_n.jpg?_nc_cat=107&_nc_sid=85a577&_nc_eui2=AeEHDdX-Ql6CWmG8Sv9cTD51h9gBxYbH0VmH2AHFhsfRWaGMb8LPeIjdFflOk6EzuC6YcLzgMB0qH7vo7oTVzTcS&_nc_ohc=4rL6v2XbsccAX_toh97&_nc_ht=scontent.fgdl5-3.fna&oh=79fa5493843e07c6674b3a00bdb6c47f&oe=5ECBD479",
      nombre: "Sushi",
      isSelected:false,
      cat_number: 2
    ),
    Store(
      id: 3,
      categoria: "Hambuerguesa",
      liked: false,
      logo: "https://scontent.fgdl5-3.fna.fbcdn.net/v/t1.0-9/15326531_1688258981504571_1307994158617097759_n.jpg?_nc_cat=107&_nc_sid=85a577&_nc_ohc=4rL6v2XbsccAX_toh97&_nc_ht=scontent.fgdl5-3.fna&oh=591fa5b2873840cc02582548f6ff2bc2&oe=5ECBD479",
      nombre: "Carl's jr",
      isSelected: false,
      cat_number: 1
    ),
  ];
}