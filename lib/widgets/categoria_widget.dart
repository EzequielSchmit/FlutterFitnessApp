import 'package:fitness_app/model/Categoria.dart';
import 'package:flutter/material.dart';

class CategoriaWidget extends StatelessWidget {
  const CategoriaWidget({
    super.key,
    required this.categoria,
  });

  final Categoria categoria;

  @override
  Widget build(BuildContext context) {
    return Text(categoria.nombre);
  }
}
