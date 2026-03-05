import 'package:fitness_app/models/subcategoria.dart';
import 'package:fitness_app/util/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubcategoriaWidget extends StatelessWidget {
  const SubcategoriaWidget({
    super.key,
    required this.subcategoria,
    required this.setSubcategoriaSeleccionada,
    required this.isSelected,
    required this.width,
    this.height = 0,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(0),
  });

  final Subcategoria subcategoria;
  final EdgeInsets padding;
  final EdgeInsets margin; 
  final double width, height;
  final void Function(Subcategoria?) setSubcategoriaSeleccionada;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    const Color.fromARGB(255, 57, 139, 255); //Colors.white, //categoria.themeColor,
    return GestureDetector(
      onTap: () {
        setSubcategoriaSeleccionada(isSelected? null : subcategoria);
      },
      child: Stack(

        children: [
          Container(
            width: padding.horizontal + (width > 0? width : 95),
            height: padding.vertical + (height > 0? height : 130),
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              color: Colores.colorItems,
              
              //const Color.fromARGB(255, 57, 139, 255), //Colors.white, //categoria.themeColor,
              
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getImage(widgetWidth: width - 20),
                Text(
                  subcategoria.nombre,
                  textAlign: TextAlign.center,
                  style: TextStyle( fontWeight: FontWeight.w500, fontSize: 12),
                ),
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

  Widget getImage({required double widgetWidth}) {
    double padding = 5;
    double iconWidth = widgetWidth - 2*padding;
    if (subcategoria.iconPath.endsWith(".svg")) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.all(10),
          // width: 30,
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(subcategoria.iconPath),
        );
    } else {
      // return Image.asset(categoria.iconPath);
      return Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Image.asset(subcategoria.iconPath,
            // opacity: Animation.fromValueListenable(transformer: (double p0){return 0.1;},),
            width: iconWidth,
            height: iconWidth,
            fit: BoxFit.cover,
            color: Colors.white.withAlpha(100),
            colorBlendMode: BlendMode.lighten,
          ),
        ),
      );
    }
  }
}
