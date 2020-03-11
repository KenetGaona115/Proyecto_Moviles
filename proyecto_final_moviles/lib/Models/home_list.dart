import 'package:proyecto_final_moviles/Models/categoria.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';

class HomeList {
  static List<Categoria> categoryList = [
    Categoria(
      categoria: "Hambugesas",
      id: 1,
      image: "https://i.ytimg.com/vi/dGJlpgaXgAA/maxresdefault.jpg",
      liked: true
    ),
    Categoria(
      categoria: "Sushi",
      id: 2,
      image: "https://sifu.unileversolutions.com/image/es-MX/recipe-topvisual/2/1260-709/sushi-empanizado-50425579.jpg",
    ),
    Categoria(
      categoria: "Tacos",
      id: 3,
      image: "https://dam.cocinafacil.com.mx/wp-content/uploads/2019/08/tacos-campechanos.jpg",
    ),
    Categoria(
      categoria: "Nieve",
      id: 4,
      image: "https://impulsoedomex.com.mx/wp-content/uploads/2017/05/helado_extravagante.jpg",
    )
  ];
  static List<Store> restaurantList =[
    Store(
      id: 1,
      categoria: "Tacos",
      liked: true,
      logo: "https://image.freepik.com/vector-gratis/logo-fiery-tacos_54548-10.jpg",
      nombre: "Tacos la flama",
      isSelected:true
    ),
    Store(
      id: 2,
      categoria: "Sushi",
      liked: false,
      logo: "https://static-images.ifood.com.br/image/upload/f_auto,t_high/logosgde/945b659a-0f6d-424a-ac3f-a0e435e814b8_SUSHI_ACIO01.PNG",
      nombre: "Sushi Express",
      isSelected:false,
    ),
    Store(
      id: 3,
      categoria: "Hambuergresa",
      liked: false,
      logo: "https://image.winudf.com/v2/image/Y29tLm9uZXppbmUuY2FybHNqcl9pY29uXzE1MDM5NTk4ODlfMDc4/icon.png?w=170&fakeurl=1",
      nombre: "Carl's jr",
      isSelected: false,
    ),
  ];
}