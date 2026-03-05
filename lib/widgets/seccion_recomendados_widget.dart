import 'package:fitness_app/models/comida.dart';
import 'package:fitness_app/widgets/recomendacion_widget.dart';
import 'package:flutter/material.dart';
import "package:fitness_app/util/utilities.dart";

class SeccionRecomendadosWidget extends StatelessWidget {
  SeccionRecomendadosWidget({super.key, required this.recomendaciones, required this.recomendacionSeleccionada, required this.setRecomendacionSeleccionada, required this.future});

  final Comida? recomendacionSeleccionada;
  final void Function(Comida?) setRecomendacionSeleccionada;
  final ScrollController _controller = ScrollController();
  final Future<List<Comida>> future;
  final List<Comida> recomendaciones;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colores.colorSeccionItems,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        separatorBuilder: (context, index) => SizedBox( width: 15, ),
        itemCount: recomendaciones.length,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.center,
          child: RecomendacionWidget(recomendacion: recomendaciones[index], width: 220, isSelected: (recomendacionSeleccionada == recomendaciones[index]), setRecomendacionSeleccionado: setRecomendacionSeleccionada,),
        ),
      ),
    );
  }
}