import 'package:fitness_app/models/subcategoria.dart';
import 'package:fitness_app/widgets/subcategoria_widget.dart';
import 'package:flutter/material.dart';
import "package:fitness_app/util/utilities.dart";

class SeccionSubcategoriasWidget extends StatelessWidget {
  const SeccionSubcategoriasWidget({
    super.key,
    required this.subcategorias,
    required this.subcategoriaSeleccionada,
    required this.setSubcategoriaSeleccionada,
  });

  final List<Subcategoria> subcategorias;
  final Subcategoria? subcategoriaSeleccionada;
  final void Function(Subcategoria?) setSubcategoriaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colores.colorSeccionItems, 
        borderRadius: BorderRadius.circular(20),
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 20,

          children: subcategorias.map( (categoria) {
            return SubcategoriaWidget(
                subcategoria: categoria,
                width: 95,
                height: 150,
                setSubcategoriaSeleccionada: setSubcategoriaSeleccionada,
                isSelected: subcategoriaSeleccionada?.nombre == categoria.nombre,
              );
          }, ).toList(),
        ),
      )

      // child: ListView.separated(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: categorias.length,
      //   separatorBuilder: (context, index) => SizedBox(
      //     width: 20,
      //   ),
      //   itemBuilder: (context, index) =>Align(
      //     alignment: Alignment.center,
      //     child: CategoriaWidget(
      //       categoria: categorias[index],
      //       width: 95,
      //       height: 150,
      //     ),
      //   ),
      // ),
    );
  }
}
