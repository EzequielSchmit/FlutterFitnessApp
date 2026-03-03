import 'package:fitness_app/models/recomendacion.dart';
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

    return Container(
      height: height != 0? height : null,
      width: width != 0? width : null,
      decoration: BoxDecoration(
        color: recomendacion.themeColor,
        borderRadius: BorderRadius.circular(15)
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
                color: _isDarkColor(themeColor) ? const Color.fromARGB(255, 198, 198, 198) : const Color.fromARGB(255, 126, 126, 126),
              ),
            ),
          TextButton(
            onPressed: ()=>print("hi"),
            child: Container(
              decoration: BoxDecoration(
                color: strongThemeColor,
                borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text("View",
                style: TextStyle(
                  color: _isDarkColor(strongThemeColor) ? Colors.white : Colors.black
                )
              ),
            ), 
          ),
        ],
      ),
    );
  }
}

bool _isDarkColor(Color color){
  return (color.r < 0.604 || color.g < 0.604 || color.b < 0.604);
}
