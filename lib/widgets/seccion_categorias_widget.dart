import 'package:fitness_app/models/categoria.dart';
import 'package:fitness_app/pages/meal_page.dart';
import 'package:fitness_app/widgets/categoria_widget.dart';
import 'package:flutter/material.dart';

class SeccionCategoriasWidget extends StatelessWidget {
  const SeccionCategoriasWidget({
    super.key,
    required this.categorias
  });

  final List<Categoria> categorias;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colores.iconColor.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) =>Align(
          alignment: Alignment.center,
          child: CategoriaWidget(
            categoria: categorias[index],
            width: 95,
          ),
        ),
      ),
    );
  }
}
