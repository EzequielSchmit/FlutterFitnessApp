import 'package:fitness_app/models/comida.dart';
import 'package:fitness_app/pages/meal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecomendacionWidget extends StatelessWidget{

  const RecomendacionWidget({super.key, required this.recomendacion, this.isSelected = false, this.width = 0, this.height = 0, required this.setRecomendacionSeleccionado});

  final double width, height;
  final Comida recomendacion;
  final bool isSelected;
  final Function(Comida) setRecomendacionSeleccionado;

  @override
  Widget build(BuildContext context) {
    Color themeColor = recomendacion.themeColor,
          strongThemeColor = recomendacion.strongThemeColor;
    
    const double iconWidth = 120;
    return GestureDetector(
      onTap: (){
        setRecomendacionSeleccionado(recomendacion);
        Scrollable.ensureVisible(
          context,
          alignment: 0,
          duration: Duration(milliseconds: 300)
        );
      },
      child: Stack(
        children: [
          Container(
            height: height != 0? height : null,
            width: width != 0? width : null,
            decoration: BoxDecoration(
              color: recomendacion.themeColor,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getIconComidaRecomendada(iconWidth: iconWidth, recomendacion: recomendacion),
                _getTextNombreRecomendacion(recomendacion: recomendacion),
                _getTextDescripcion(recomendacion: recomendacion),
                _getTextButtonView(recomendacion: recomendacion, isSelected: isSelected),
              ],
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: isSelected? Border.all(color: const Color(0xff9DCEFF), strokeAlign: BorderSide.strokeAlignInside, width: 4) : null,
                ),
              ),
            )
          )
        ]
      ),
    );
  }

}

bool _isDarkColor(Color color){
  return (color.r < 0.604 || color.g < 0.604 || color.b < 0.604);
}

Widget _getIconComidaRecomendada({required double iconWidth, required Comida recomendacion}){
  print("path: ${Paths.foodImagesPath}${recomendacion.nombreIcono}");
  return ClipRRect(
    borderRadius: BorderRadiusGeometry.circular(20),
    child: Image.asset("${Paths.foodImagesPath}${recomendacion.nombreIcono}",
      width: double.infinity,
      height: iconWidth,
      fit: BoxFit.cover,
    ),
  );
  
  return SizedBox(
    // margin: EdgeInsets.only(top: 10),
    width: iconWidth,
    height: iconWidth,
    child: SvgPicture.asset(
      recomendacion.nombreIcono,
    ),
  );
}

Text _getTextNombreRecomendacion({required Comida recomendacion}) {
  return Text(
    recomendacion.nombre,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: _isDarkColor(recomendacion.themeColor) ? Colors.white : Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget _getTextDescripcion({required Comida recomendacion}){
  String descripcion = "${recomendacion.dificultad} | ${recomendacion.tiempo}mins  | ${recomendacion.calorias}kcal";
  return Text(
    descripcion,
    style: TextStyle(
      fontSize: 14,
      color: _isDarkColor(recomendacion.themeColor) ? const Color.fromARGB(255, 198, 198, 198) : const Color.fromARGB(255, 126, 126, 126),
    ),
  );
}

Widget _getTextButtonView({required Comida recomendacion, required bool isSelected}) {
  return TextButton(
    onPressed: ()=>print("View recomendacion: ${recomendacion.toString()}"),
    child: Container(
      height: 45,
      width: 130,
      decoration: BoxDecoration(
        gradient: isSelected ?
          LinearGradient(
            colors: [
              const Color(0xff9DCEFF),
              const Color(0xff92A3FD),
            ]
          ) : null,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text("View",
        style: TextStyle(
          color: isSelected ? Colors.white : Color.alphaBlend(recomendacion.themeColor.withAlpha(130), Colors.black),
        )
      ),
    ),
  );
}