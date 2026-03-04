import 'package:flutter/material.dart';

class Recomendacion {
  Recomendacion({required this.nombre, this.descripcion = "", required this.iconPath, required this.themeColor, required this.strongThemeColor});

  final String nombre, descripcion, iconPath;
  final Color themeColor, strongThemeColor;

  String toString(){
    return "Recomendacion: {nombre:'$nombre', descripcion:'$descripcion'}";
  }
}
