import 'package:fitness_app/models/subcategoria.dart';
import 'package:fitness_app/util/utilities.dart';
import 'package:fitness_app/models/comida.dart';
import 'package:fitness_app/widgets/seccion_subcategorias_widget.dart';
import 'package:fitness_app/widgets/seccion_recomendados_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key, required this.comidaDelDiaSeleccionada});
  final ComidasDelDia comidaDelDiaSeleccionada;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late Future<List<Comida>> _comidasFuture;
  
  Comida? recomendacionSeleccionada;
  Subcategoria? subcategoriaSeleccionada;

  @override
  void initState(){
    super.initState();
    _comidasFuture = _buscarYFiltrarComidasPorComidaDelDia(widget.comidaDelDiaSeleccionada);
  }

  Future<List<Comida>> _buscarYFiltrarComidasPorComidaDelDia(ComidasDelDia comidaDelDiaSeleccionada) async {
    List<Comida> todasLasComidas = await obtenerComidas();
    return todasLasComidas.where((comida) => comida.categoria == comidaDelDiaSeleccionada.nombreEnJson).toList();
  }

  List<Subcategoria> _obtenerSubcategorias(List<Comida> comidas){
    Map<String,String> subcategoriasMap = {};

    // Set<String> categoriasSet = {};
    for (Comida comida in comidas){
      for (String subcategoria in comida.subcategorias){
        // categoriasSet.add(subcategoria);
        subcategoriasMap[subcategoria] = comida.nombreIcono;
      }
    }
    List<Subcategoria> subcategorias = [];
    Iterable<MapEntry<String,String>> entries = subcategoriasMap.entries;
    int i = 0;
    for (MapEntry<String,String> entry in entries){
      String subcategoria = entry.key;
      String imageName = entry.value;
      subcategorias.add(
        Subcategoria(
          nombre: subcategoria,
          iconPath: "${Paths.foodImagesPath}$imageName",
          themeColor: i++%2==0? Colores.color1 : Colores.color2
        )
      );
    }

    return subcategorias;
  }

  List<Comida> filtrarComidasPorSubcategorias(List<Comida> comidas, Subcategoria? subcategoria){
    return subcategoria == null? comidas : comidas.where((comida) => comida.subcategorias.contains(subcategoria.nombre)).toList();
  }

  void setSubcategoriaSeleccionada(Subcategoria? subcategoriaASeleccionar) {
    setState(() {
      recomendacionSeleccionada = null;
      subcategoriaSeleccionada = subcategoriaASeleccionar;
    });
  }

  void setRecomendacionSeleccionada(Comida? recomendacionASeleccionar){
    setState(() {
      recomendacionSeleccionada = recomendacionASeleccionar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setRecomendacionSeleccionada(null);
      },
      child: Container(
        color: Colores.colorBgScaffold,
        child: ListView(
          children: [
            getSearchField(),
            const SizedBox(height: 50,),
            FutureBuilder(
              future: _comidasFuture,
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center( child: CircularProgressIndicator(),);
                }
        
                if (snapshot.hasError) {
                  return const Center(child: Text("Error al obtener datos.)", textAlign: TextAlign.center,));
                }
        
                if (!snapshot.hasData || snapshot.data!.isEmpty){
                  return const Center(child: Text("No hay datos para la comida del dia elegida.)", textAlign: TextAlign.center,));
                }
        
                List<Comida> comidas = snapshot.data!;
                List<Subcategoria> subcategorias = _obtenerSubcategorias(comidas);
                List<Comida> recomendacionesSegunSubcategoriaSeleccionada = filtrarComidasPorSubcategorias(comidas, subcategoriaSeleccionada);
                return Column(
                  children: [
                    getSeccionSubategoria(subcategorias,),
                    const SizedBox(height: 50,),
                    getSeccionRecomendaciones(recomendacionesSegunSubcategoriaSeleccionada),
                  ],
                );
              },
            )
          ],
        ),
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

  Container getSeccionSubategoria(List<Subcategoria> categorias) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text("Categoría", style: Estilos.sectionTitleStyle),
              ),
              const SizedBox(
                height: 15,
              ),
              SeccionSubcategoriasWidget(subcategorias: categorias, setSubcategoriaSeleccionada: setSubcategoriaSeleccionada, subcategoriaSeleccionada: subcategoriaSeleccionada,),
            ],
          ),
        );
  }

  Container getSearchField() {
    ColorFilter iconColorFilter = ColorFilter.mode(Colores.colorIcon, BlendMode.srcIn);
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
                      color: Colores.colorIcon,
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
            style: Estilos.searchInputStyle,

            
          )
        );
  }
    
}
