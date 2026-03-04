import 'package:fitness_app/models/recomendacion.dart';
import 'package:fitness_app/widgets/recomendacion_widget.dart';
import 'package:fitness_app/pages/home.dart';
import 'package:flutter/material.dart';

class SeccionRecomendadosWidget extends StatefulWidget {
  const SeccionRecomendadosWidget({super.key, this.recomendaciones = const []});

  final List<Recomendacion> recomendaciones;

  @override
  State<SeccionRecomendadosWidget> createState() => _SeccionRecomendadosWidgetState();
}

class _SeccionRecomendadosWidgetState extends State<SeccionRecomendadosWidget> {

  late Recomendacion recomendacionSeleccionada;

  void setRecomendacionSeleccionado(Recomendacion recomendacion){
    setState(() {
      recomendacionSeleccionada = recomendacion;
    });
  }

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
        // separatorBuilder: (context, index) => SizedBox(width: 20,),
        separatorBuilder: (context, index) => SizedBox( width: 15, ),
        itemCount: widget.recomendaciones.length,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.center,
          child: RecomendacionWidget(recomendacion: widget.recomendaciones[index], width: 220, isSelected: (recomendacionSeleccionada == widget.recomendaciones[index]), setRecomendacionSeleccionado: setRecomendacionSeleccionado,),
        ),
      ),
    );
  }
}