import 'package:fitness_app/models/categoria.dart';
import 'package:fitness_app/util/utilities.dart';
import 'package:fitness_app/models/comida.dart';
import 'package:fitness_app/widgets/categoria_widget.dart';
import 'package:fitness_app/widgets/seccion_recomendados_widget.dart';
import 'package:flutter/material.dart';
import "package:fitness_app/pages/meal_page.dart";
import 'package:flutter_svg/svg.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key, required this.categoriaSeleccionada});
  final CategoriasComida categoriaSeleccionada;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late Future<List<Comida>> _comidasFuture;
  
  List<Comida> recomendaciones = [];
  List<Categoria> categorias = [];
  Comida? recomendacionSeleccionada;

  @override
  void initState(){
    super.initState();
    //ignora esta parte:
    /*List<String> categoriasStrings = [];

    for (var i = 0; i < categoriasStrings.length; i++) {
      String categoria = categoriasStrings[i];
      categorias.add(
        Categoria(
          nombre: categoria,
          iconPath: "${Paths.foodIconsPath}${categoria.toLowerCase()}.svg",
          themeColor: i%2==0? Colores.color1 : Colores.color2
        )
      );
    }*/
    


    _comidasFuture = _buscarYFiltrarComidas(widget.categoriaSeleccionada);
  }

  Future<List<Comida>> _buscarYFiltrarComidas(CategoriasComida categoriaComidaSeleccionada) async {
    List<Comida> todasLasComidas = await obtenerComidas();
    return todasLasComidas.where((comida) => comida.categoria == categoriaComidaSeleccionada.nombreEnJson).toList();
  }

  void setRecomendacionSeleccionada(Comida? recomendacionASeleccionar){
    setState(() {
      recomendacionSeleccionada = recomendacionASeleccionar;
      print("Seleccionar recomendacion: ${recomendacionSeleccionada?.nombre}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setRecomendacionSeleccionada(null);
      },
      child: ListView(
        children: [
          getSearchField(),
          const SizedBox(height: 50,),
          getSeccionCategoria(categorias,),
          const SizedBox(height: 50,),
          getSeccionRecomendaciones(recomendaciones),
        ],
      ),
    );
  }








  Container getSeccionRecomendaciones(List<Comida> recomendaciones) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Recomendaciones \npara dieta", style: Estilos.sectionTitleStyle,)
              ),
              const SizedBox(
                height: 15,
              ),
              SeccionRecomendadosWidget(recomendaciones: recomendaciones, recomendacionSeleccionada: recomendacionSeleccionada, setRecomendacionSeleccionada: setRecomendacionSeleccionada, future: _comidasFuture),
            ],
          ),
        );
  }

  Container getSeccionCategoria(List<Categoria> categorias) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                // padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text("Categoría", style: Estilos.sectionTitleStyle),
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
                  "${Paths.iconsPath}Search.svg",
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
                      child: SvgPicture.asset("${Paths.iconsPath}Filter.svg", colorFilter: iconColorFilter, width: 32,),
                    ),
                  ],
                ),
              ),
              
              hintText: "Buscar comida",
              hintStyle: Estilos.hintSearchInput,
              
            ),
            style: Estilos.searchInput,

            
          )
        );
  }
    
}
