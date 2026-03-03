import "package:fitness_app/model/Categoria.dart";
import "package:fitness_app/widgets/categoria_widget.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    const Color scaffoldBgColor = Colors.white,
                iconColor = Colors.grey,
                inputColor = Colors.black;
    const ColorFilter iconColorFilter = ColorFilter.mode(iconColor, BlendMode.srcIn);

    List<Categoria> categorias = [];

    {
      List<String> categoriasStrings = ["Ensalada", "Biscochuelo", "Tortilla", "Licuado"];
      for (var i = 0; i < categoriasStrings.length; i++) {
        String categoria = categoriasStrings[i];
        categorias.add(
          Categoria(
            nombre: categoria,
            iconPath: "assets/icon/category/${categoria.toLowerCase()}.svg",
            themeColor: i%2==0? const Color.fromARGB(255, 183, 210, 255) : const Color.fromARGB(255, 255, 206, 206)
          )
        );
      }
    }

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: MyBar(backgroundColor: scaffoldBgColor),
      // extendBodyBehindAppBar: false,
      body: Column(
        children: [
          getSearchField(iconColorFilter, iconColor, inputColor),
          // Column(
          //   children: [
          //     Text("Categoría"),
          //     Row(
          //       children: [
          //         for (Categoria categoria in categorias)
          //           CategoriaWidget(categoria: categoria)
          //       ],
          //     )
          //   ],
          // )
        ],
      )
    );
  }

  Container getSearchField(ColorFilter iconColorFilter, Color iconColor, Color inputColor) {
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
                  "assets/icons/Search.svg",
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
                      color: iconColor,
                      thickness: 0.3,
                      indent: 10,
                      endIndent: 10,
                      width: 1,
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/icons/Filter.svg", colorFilter: iconColorFilter, width: 32,),
                    ),
                  ],
                ),
              ),
              
              hintText: "Buscar comida",
              hintStyle: TextStyle(
                color: iconColor,
                fontSize: 14
              )
              
            ),
            style: TextStyle(
              color: inputColor,
            ),

            
          )
        );
  }
}

class MyBar extends StatelessWidget implements PreferredSizeWidget{
  final Color backgroundColor;
  
  const MyBar({
    super.key,
    required this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      
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
        child: MySvgButton("assets/icons/Arrow - Left 2.svg", 20, 20),
      ),
    
      actions: [
        GestureDetector(
          onTap: (){
          },
          child: MySvgButton("assets/icons/dots.svg", 5, 5),
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