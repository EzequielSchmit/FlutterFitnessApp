import 'package:fitness_app/models/recomendacion.dart';
import 'package:fitness_app/widgets/recomendacion_widget.dart';
import 'package:fitness_app/pages/meal_page.dart';
import 'package:flutter/material.dart';

class SeccionRecomendadosWidget extends StatelessWidget {
  SeccionRecomendadosWidget({super.key, this.recomendaciones = const [], required this.recomendacionSeleccionada, required this.setRecomendacionSeleccionada});

  final List<Recomendacion> recomendaciones;
  final Recomendacion? recomendacionSeleccionada;
  final void Function(Recomendacion) setRecomendacionSeleccionada;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colores.iconColor.withAlpha(20),
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