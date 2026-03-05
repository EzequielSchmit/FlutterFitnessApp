import 'package:fitness_app/pages/meal_page.dart';
import 'package:fitness_app/util/utilities.dart';
import 'package:flutter/material.dart';

class Comida {
  Comida({required this.id, required this.nombre, required this.descripcion, required this.categoria, required this.subcategorias,
          required this.calorias, required this.tiempo, required this.dificultad, required this.tags, required this.nombreIcono,
          required this.themeColor, required this.strongThemeColor});

  final String id, nombre, descripcion, nombreIcono, categoria;
  final List<String> subcategorias, tags;
  final int calorias, tiempo;
  final String dificultad;
  final Color themeColor, strongThemeColor;

  String toString(){
    return "Recomendacion: {nombre:'$nombre', descripcion:'$descripcion'}";
  }

  static int cantComidasCreadas = 0;

  factory Comida.fromJson(Map<String,dynamic> json){

    List<Color> colors = [Colores.color1, Colores.color2];
    List<Color> strongColors = [Colores.strongColor1, Colores.strongColor2];
    
    List<String> arreglarLista(dynamic valor){
      if (valor == null) return [];
      if (valor is String) {
        return valor.split(',').map((e) => e.trim()).toList();
      }
      if (valor is Iterable) {
        return List<String>.from(valor);
      }
      return [];
    }

    return Comida(
      id: json["id"],
      nombre: json["nombre"] ?? "",
      descripcion: json["descripcion"] ?? "",
      categoria: json["categoria"] ?? "",
      subcategorias: arreglarLista(json["subcategorias"]),
      calorias: json["calorias"] ?? -1,
      tiempo: json["tiempo"] ?? -1,
      dificultad: json["dificultad"] ?? "",
      tags: arreglarLista(json["tags"]),
      nombreIcono: json["nombre_icono"] ?? "",
      themeColor: colors[cantComidasCreadas%2],
      strongThemeColor: strongColors[cantComidasCreadas%2],
    );
  }

}
