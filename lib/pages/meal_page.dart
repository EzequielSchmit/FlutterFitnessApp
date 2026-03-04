import "package:fitness_app/models/comidas.dart";
import "package:fitness_app/widgets/body_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class MealPage extends StatelessWidget {
  const MealPage({super.key, required this.comida});

  final Comidas comida;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colores.scaffoldBgColor,
      appBar: getBar(context, comida: comida),
      body: BodyWidget(comida: comida),
    );
  }

  AppBar getBar(BuildContext context, {required Comidas comida}){
    
    return AppBar(
      backgroundColor: Colores.scaffoldBgColor,
      surfaceTintColor: Colores.scaffoldBgColor,
      animateColor: true,

      title:Text(comida.nombreFormateado,
        style: Estilos.titleStyle,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: MySvgButton("${Paths.iconsPath}Arrow - Left 2.svg", 20, 20),
      ),
    
      actions: [
        GestureDetector(
          onTap: (){
          },
          child: MySvgButton("${Paths.iconsPath}dots.svg", 5, 5),
        ),
      ],

    );
  }

}

class MySvgButton extends StatelessWidget {
  final String path;
  final double width, height;
  const MySvgButton(this.path, this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        path,
        height: height,
        width: width,
      ),          
    );
  }
}

class Colores {
  static const Color  color1 = Color.fromARGB(255, 255, 239, 239),
                      strongColor1 = Color.fromARGB(255, 255, 209, 209),
                      color2 = Color.fromARGB(255, 242, 248, 255),
                      strongColor2 = Color.fromARGB(255, 203, 227, 255),
                      scaffoldBgColor = Colors.white,
                      iconColor = Colors.grey,
                      inputColor = Colors.black;
}

class Estilos {
  static const TextStyle  sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),
                          titleStyle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),
                          hintSearchInput = TextStyle(color: Colores.iconColor, fontSize: 14),
                          searchInput = TextStyle(color: Colores.inputColor,);
}

class Paths {
  static const String iconsPath = "assets/icons/",
                      foodIconsPath = "assets/icons/category/";
}
