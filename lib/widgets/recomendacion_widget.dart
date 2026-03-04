import 'package:fitness_app/models/recomendacion.dart';
import 'package:fitness_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecomendacionWidget extends StatelessWidget{

  const RecomendacionWidget({super.key, required this.recomendacion, this.width = 0, this.height = 0});

  final double width, height;
  final Recomendacion recomendacion;

  @override
  Widget build(BuildContext context) {
    Color themeColor = recomendacion.themeColor,
          strongThemeColor = recomendacion.strongThemeColor;
    
    const double iconWidth = 120;
    return GestureDetector(
      onTap: (){
        print("Seleccionar recomendacion: ${recomendacion.nombre}");
        if (!recomendacion.isSelected){
          //deseleccionar otras
          //seleccionar
        }
      },
      child: Container(
        height: height != 0? height : null,
        width: width != 0? width : null,
        decoration: BoxDecoration(
          color: recomendacion.themeColor,
          borderRadius: BorderRadius.circular(15),
          border: recomendacion.isSelected? Border.all(color: const Color(0xff9DCEFF), strokeAlign: BorderSide.strokeAlignInside, width: 4) : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              // margin: EdgeInsets.only(top: 10),
              width: iconWidth,
              height: iconWidth,
              child: SvgPicture.asset(
                recomendacion.iconPath,
              ),
            ),
            Text(
              recomendacion.nombre,
              style: TextStyle(
                color: _isDarkColor(themeColor) ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (recomendacion.descripcion != "")
              Text(
                recomendacion.descripcion,
                style: TextStyle(
                  fontSize: 14,
                  color: _isDarkColor(themeColor) ? const Color.fromARGB(255, 198, 198, 198) : const Color.fromARGB(255, 126, 126, 126),
                ),
              ),
            TextButton(
              onPressed: ()=>print("View recomendacion: ${recomendacion.toString()}"),
              child: Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                  gradient: recomendacion.isSelected ?
                    LinearGradient(
                      colors: [
                        const Color(0xff9DCEFF),
                        const Color(0xff92A3FD),
                      ]
                    ) : null,
                  borderRadius: BorderRadius.circular(20)
                ),
                alignment: Alignment.center,
                child: Text("View",
                  style: TextStyle(
                    color: recomendacion.isSelected ? Colors.white : Color.alphaBlend(themeColor.withAlpha(130), Colors.black),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isDarkColor(Color color){
  return (color.r < 0.604 || color.g < 0.604 || color.b < 0.604);
}
