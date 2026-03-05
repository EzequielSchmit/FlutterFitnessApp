import 'package:fitness_app/models/comida.dart';
import 'package:fitness_app/widgets/recomendacion_widget.dart';
import 'package:fitness_app/pages/meal_page.dart';
import 'package:flutter/material.dart';

class SeccionRecomendadosWidget extends StatelessWidget {
  SeccionRecomendadosWidget({super.key, this.recomendaciones = const [], required this.recomendacionSeleccionada, required this.setRecomendacionSeleccionada, required this.future});

  final List<Comida> recomendaciones;
  final Comida? recomendacionSeleccionada;
  final void Function(Comida) setRecomendacionSeleccionada;
  final ScrollController _controller = ScrollController();
  final Future<List<Comida>> future;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colores.iconColor.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center( child: CircularProgressIndicator(),);
          }

          if (snapshot.hasError) {
            print('🔥 ERROR REAL DEL SNAPSHOT: ${snapshot.error}');
            return const Center( child: Text("Error al cargar recomendaciones"),);
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center( child: Text("No hay recomendaciones para esta categoria."),);
          }

          List<Comida> comidas = snapshot.data!;

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            separatorBuilder: (context, index) => SizedBox( width: 15, ),
            itemCount: comidas.length,
            itemBuilder: (context, index) => Align(
              alignment: Alignment.center,
              child: RecomendacionWidget(recomendacion: comidas[index], width: 220, isSelected: (recomendacionSeleccionada == comidas[index]), setRecomendacionSeleccionado: setRecomendacionSeleccionada,),
            ),
          );
        },
      ),
    );
  }
}