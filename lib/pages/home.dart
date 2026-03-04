import "package:fitness_app/models/categoria.dart";
import "package:fitness_app/models/recomendacion.dart";
import "package:fitness_app/widgets/categoria_widget.dart";
import "package:fitness_app/widgets/recomendacion_widget.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String iconsPath = "assets/icons/";
  final String foodIconsPath = "assets/icons/category/";

  @override
  Widget build(BuildContext context) {
    const TextStyle sectionTitleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    
    

    List<Categoria> categorias = [];

    {
      List<String> categoriasStrings = ["Ensalada", "Torta", "Panqueque", "Batido"];
      for (var i = 0; i < categoriasStrings.length; i++) {
        String categoria = categoriasStrings[i];
        categorias.add(
          Categoria(
            nombre: categoria,
            iconPath: "$foodIconsPath${categoria.toLowerCase()}.svg",
            themeColor: i%2==0? Colores.color1 : Colores.color2
          )
        );
      }
    }

    
    List<Recomendacion> recomendaciones = [
      Recomendacion(
        iconPath: "${foodIconsPath}honey-pancakes.svg",
        nombre: "Panqueques de miel",
        descripcion: "Facil | 20 mins | 180 kcal",
        themeColor: Colores.color1,
        strongThemeColor: Colores.strongColor1,
        isSelected: true,
      ),
      Recomendacion(
        iconPath: "${foodIconsPath}blueberry-pancake.svg",
        nombre: "Panqueques de arándanos",
        descripcion: "Facil | 20 mins | 220 kcal",
        themeColor: Colores.color2,
        strongThemeColor: Colores.strongColor2,
      ),
      
    ];
    return Scaffold(
      backgroundColor: Colores.scaffoldBgColor,
      appBar: getBar(),
      // extendBodyBehindAppBar: false,
      body: ListView(
        children: [
          getSearchField(),
          const SizedBox(height: 50,),
          getSeccionCategoria(sectionTitleStyle, categorias,),
          const SizedBox(height: 50,),
          getSeccionRecomendaciones(sectionTitleStyle, recomendaciones),
        ],
      )
    );
  }

  Container getSeccionRecomendaciones(TextStyle sectionTitleStyle, List<Recomendacion> recomendaciones) {
    return Container(
          // height: 150,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Recomendaciones \npara dieta", style: sectionTitleStyle,)
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 280,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colores.iconColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // separatorBuilder: (context, index) => SizedBox(width: 20,),
                  separatorBuilder: (context, index) => SizedBox( width: 15, ),
                  itemCount: recomendaciones.length,
                  itemBuilder: (context, index) => Align(
                    alignment: Alignment.center,
                    child: RecomendacionWidget(recomendacion: recomendaciones[index], width: 200,),
                  ),
                ),
              )
            ],
          ),
        );
  }

  Container getSeccionCategoria(TextStyle sectionTitleStyle, List<Categoria> categorias) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                // padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text("Categoría", style: sectionTitleStyle),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 130,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colores.iconColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(20),
                  // border: BoxBorder.all(
                  //   color: iconColor,
                  //   width: 0.3,
                  // )
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorias.length,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemBuilder: (context, index) =>Align(
                    alignment: Alignment.center,
                    child: CategoriaWidget(
                      categoria: categorias[index],
                      width: 95,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
  }

  Container getSearchField() {
    const ColorFilter iconColorFilter = ColorFilter.mode(Colores.iconColor, BlendMode.srcIn);
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(28),
                spreadRadius: 0.0,
                blurRadius: 40,
              )
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "${iconsPath}Search.svg",
                  colorFilter: iconColorFilter,
                ),
              ),

              suffixIcon: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 0,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalDivider(
                      color: Colores.iconColor,
                      thickness: 0.3,
                      indent: 10,
                      endIndent: 10,
                      width: 1,
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("${iconsPath}Filter.svg", colorFilter: iconColorFilter, width: 32,),
                    ),
                  ],
                ),
              ),
              
              hintText: "Buscar comida",
              hintStyle: TextStyle(
                color: Colores.iconColor,
                fontSize: 14
              )
              
            ),
            style: TextStyle(
              color: Colores.inputColor,
            ),

            
          )
        );
  }
  
  AppBar getBar(){
    return AppBar(
      backgroundColor: Colores.scaffoldBgColor,
      // shadowColor: Colors.amber,
      surfaceTintColor: Colores.scaffoldBgColor,
      animateColor: true,

      title:Text("Desayuno",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    
      leading: GestureDetector(
        onTap: (){
        },
        child: MySvgButton("${iconsPath}Arrow - Left 2.svg", 20, 20),
      ),
    
      actions: [
        GestureDetector(
          onTap: (){
          },
          child: MySvgButton("${iconsPath}dots.svg", 5, 5),
        ),
      ],

    );
  }
}

class MySvgButton extends StatelessWidget {
  String path;
  double width, height;
  MySvgButton(this.path, this.width, this.height, {super.key});

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