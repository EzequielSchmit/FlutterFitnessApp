import 'dart:convert'; // Para usar jsonDecode
import 'package:fitness_app/pages/meal_page.dart';
import 'package:flutter/services.dart'; // Para usar rootBundle
import 'package:fitness_app/models/comida.dart'; // Importá el archivo donde creaste la clase

Future<List<Comida>> obtenerComidas() async {
  final String respuestaString = await rootBundle.loadString('${Paths.comidasDataPath}comidas.json');
  final List<dynamic> datosJson = jsonDecode(respuestaString);
  return datosJson.map((json) => Comida.fromJson(json)).toList();
}



enum CategoriasComida {
  desayuno(nombreFormateado: "Desayuno / Merienda", nombreEnJson: "Desayunos y meriendas"),
  comidaPrincipal(nombreFormateado: "Comida principal", nombreEnJson: "Comidas principales"),
  snack(nombreFormateado: "Colaciones / snacks", nombreEnJson: "Colaciones o snacks");

  final String nombreFormateado;
  final String nombreEnJson;

  const CategoriasComida({required this.nombreFormateado, required this.nombreEnJson});
}

enum Dificultad {
  Facil,
  Medio,
  Dificil,
  Comprado
}