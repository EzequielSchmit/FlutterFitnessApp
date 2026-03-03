import 'package:flutter/services.dart';

class Categoria {
  final String nombre;
  String iconPath;
  Color themeColor;

  Categoria( {required this.nombre, required this.iconPath, required this.themeColor}){
    iconPath = "assets/icons/pancakes.svg";
  }

}