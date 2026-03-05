import 'package:fitness_app/util/utilities.dart';
import "package:fitness_app/widgets/body_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key, required this.comida});

  final ComidasDelDia comida;

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {

  Color _colorDePrueba = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colores.colorBgScaffold,
      appBar: getBar(context, comida: widget.comida),
      body: BodyWidget(comidaDelDiaSeleccionada: widget.comida),
    );
  }

  AppBar getBar(BuildContext context, {required ComidasDelDia comida}){
    
    return AppBar(
      backgroundColor: Colores.colorAppBar,
      surfaceTintColor: Colores.colorBgScaffold,
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
            // _abrirSelectorDeColor();
          },
          child: MySvgButton("${Paths.iconsPath}dots.svg", 5, 5),
        ),
      ],

    );
  }
  //Metodo para desarrollo (permite mostrar un selector de color en el dispositivo movil y ver los colores reales RGB)
  void _abrirSelectorDeColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('picker'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _colorDePrueba,
              onColorChanged: (Color nuevoColor) {
                setState(() {
                  _colorDePrueba = nuevoColor;
                });
                String hexCode = nuevoColor.value.toRadixString(16).toUpperCase();
                print('COLOR: 0x$hexCode');
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Listo'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
