import 'package:fitness_app/models/categoria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriaWidget extends StatelessWidget {
  const CategoriaWidget({
    super.key,
    required this.categoria,
    this.width = 0,
    this.height = 0,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  });

  final Categoria categoria;
  final EdgeInsets padding;
  final EdgeInsets margin; 
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      // (width > 0 ? width: width),
      
      width: width > 0? width : null,
      height: height > 0? height : null,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: categoria.themeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            // width: 30,
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(categoria.iconPath)
          ),
          Text(categoria.nombre, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
