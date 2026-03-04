import 'package:flutter/material.dart';

class Recomendacion {
  Recomendacion({required this.nombre, this.descripcion = "", required this.iconPath, required this.themeColor, required this.strongThemeColor, this.isSelected = false});

  final String nombre, descripcion, iconPath;
  final Color themeColor, strongThemeColor;
  final bool isSelected;

  String toString(){
    return "Recomendacion: {nombre:'$nombre', descripcion:'$descripcion', isSelected:'$isSelected'}";
  }
}
