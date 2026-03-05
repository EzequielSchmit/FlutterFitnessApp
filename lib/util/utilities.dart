import 'dart:convert'; // Para usar jsonDecode
import 'package:fitness_app/pages/meal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para usar rootBundle
import 'package:fitness_app/models/comida.dart'; // Importá el archivo donde creaste la clase

Future<List<Comida>> obtenerComidas() async {
  final String respuestaString = await rootBundle.loadString('${Paths.comidasDataPath}comidas.json');
  final List<dynamic> datosJson = jsonDecode(respuestaString);
  return datosJson.map((json) => Comida.fromJson(json)).toList();
}

enum ComidasDelDia {
  desayuno(nombreFormateado: "Desayuno / Merienda", nombreEnJson: "Desayunos y meriendas"),
  comidaPrincipal(nombreFormateado: "Comida principal", nombreEnJson: "Comidas principales"),
  snack(nombreFormateado: "Colaciones / snacks", nombreEnJson: "Colaciones o snacks");

  final String nombreFormateado;
  final String nombreEnJson;

  const ComidasDelDia({required this.nombreFormateado, required this.nombreEnJson});
}

enum Dificultad {
  Facil,
  Medio,
  Dificil,
  Comprado
}

class Colores {
  static const Color  color1 = Color.fromARGB(255, 255, 239, 239),
                      color1Strong = Color.fromARGB(255, 255, 209, 209),
                      color2 = Color.fromARGB(255, 242, 248, 255),
                      color2Strong = Color.fromARGB(255, 203, 227, 255),
                      colorIcon = Colors.grey,
                      colorInput = Colors.black,
                      colorAppBar = Color.fromARGB(255, 130, 177, 255),
                      colorBgScaffold = Colors.white, // 
                      colorBotonHabilitado = Color.fromARGB(255, 190, 226, 255),
                      colorBotonDeshabilitado = Color.fromARGB(255, 241, 241, 241),
                      colorTextoBotonHabilitado = Color.fromARGB(255, 13, 71, 161),
                      colorTextoBotonDeshabilitado = Colors.grey,
                      colorItems =  Color.fromARGB(255, 216, 233, 255); // Color.fromARGB(255, 229, 244, 255);
  static final Color  colorSeccionItems = Colores.colorIcon.withAlpha(20);
}

class Estilos {
  static const TextStyle  sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),
                          titleStyle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),
                          hintSearchInput = TextStyle(color: Colores.colorIcon, fontSize: 14),
                          searchInputStyle = TextStyle(color: Colores.colorInput,);
}

class Paths {
  static const String iconsPath = "assets/icons/",
                      foodIconsPath = "assets/icons/category/",
                      foodImagesPath = "assets/images/comidas/",
                      comidasDataPath = "assets/data/";
}
